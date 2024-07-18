//
//  MatchesInfoViewModel.swift
//  CricInfo
//
//  Created by Mohd Kashif on 16/07/24.
//

import Foundation

/// enum for the filter matches, make it easier to perform switch cases
enum FilterEnum {
    case newest
    case oldest
    case t20
    case odi
    case test
    case notStarted
    case finished
    case all
}

class MatchesInfoViewModel:ObservableObject{
    @Published var matchesInfo=MatchResponse(data: [])
    private var client=NetworkClient()
    @Published var filterList:[MatchesList]=[]
    @Published var selectedItem:String?=nil
    @Published var selectedFilter:FilterEnum = .all
    @Published var isLoading:Bool=true

    //// getting all the matches
    func getMatches(){
        client.getMatchesList {[weak self] data, error in
            guard let self=self, let responseData=data else {return}
            if error==nil{
                DispatchQueue.main.async {
                    self.isLoading=false
                    self.matchesInfo=responseData
                }
            } else {
                print(error?.localizedDescription as Any, "error in getmatches")
            }
        }
    }
    
    
    /// filtering on the basis of user requirement
    /// returning the filtering list
    func filterMatches()->[MatchesList]{
        var matchesList:[MatchesList]
        switch selectedFilter {
        case .newest:
            matchesList=matchesInfo.data.sorted{(a, b)->Bool in
                if let date1=parseDate(a.dateTimeGMT), let date2=parseDate(b.dateTimeGMT){
                    return date1>date2
                }
                return false
            }
        case .oldest:
            matchesList=matchesInfo.data.sorted{(a, b)->Bool in
                if let date1=parseDate(a.dateTimeGMT), let date2=parseDate(b.dateTimeGMT){
                    return date1<date2
                }
                return false
            }
        case .t20:
            matchesList=self.matchesInfo.data.filter({$0.matchType=="t20"})
        case .odi:
            matchesList=self.matchesInfo.data.filter({$0.matchType=="odi"})
        case .test:
            matchesList=self.matchesInfo.data.filter({$0.matchType=="test"})
        case .all:
            matchesList=matchesInfo.data
        case .notStarted:
            matchesList=self.matchesInfo.data.filter({$0.status=="Match not started"})
        case .finished:
            matchesList=self.matchesInfo.data.filter({$0.status != "Match not started"})
        }
        return matchesList
    }

    //// parsing the date in readable format
    private func parseDate(_ dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from: dateString)
    }
}
