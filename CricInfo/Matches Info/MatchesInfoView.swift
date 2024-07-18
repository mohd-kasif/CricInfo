//
//  MatchesInfoView.swift
//  CricInfo
//
//  Created by Mohd Kashif on 16/07/24.
//

import SwiftUI

struct MatchesInfoView: View {
    @ObservedObject var vm=MatchesInfoViewModel()
    @State var isOpen:Bool=false
    @State var selectedItem:String=""
    @State var isNavigate:Bool=false
    let matchType=["T20", "Odi", "Test"]
    let matchTime=["Newest","Oldest"]
    let matchStatus=["Finished","Not Started"]
    init(){
        vm.getMatches()
    }
    var body: some View {
        NavigationView{
            ZStack{
                Color.init(hex: "#FFFAF0").ignoresSafeArea()
            VStack(alignment:.center){
                HStack(alignment:.top){
                    Spacer()
                    Text("Fixtures")
                        .bold()
                        .font(.system(size: 24))
                    Spacer()
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .onTapGesture {
                            if !vm.isLoading{
                                isOpen=true
                            }
                        }
                }
                if !vm.isLoading{
                    ScrollView(showsIndicators:false){
                        ForEach(vm.filterMatches()){item in
                            LazyVStack(spacing:5){
                                NavigationLink(destination: MatchDetailView(matchinfo: item)){
                                    MatchCard(date: item.dateTimeGMT ?? "", matchType: item.matchType ?? "", result: item.status ?? "", team1: item.t1 ?? "", team2: item.t2 ?? "", score1: item.t1s ?? "", score2: item.t2s ?? "",team1url: item.t1img ?? "", team2url: item.t2img ?? "")
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .MatchFilterSheet(isPresented: $isOpen) {
                        VStack(alignment:.leading){
                            Text("Match Type")
                                .foregroundColor(Color.init(hex: "#283E51"))
                                .bold()
                            HStack{
                                ForEach(0..<matchType.count, id:\.self){type in
                                    FilterButton(text: matchType[type], selectedItem: $vm.selectedItem){
                                        if let selectedItem=vm.selectedItem{
                                            if selectedItem=="T20"{
                                                vm.selectedFilter = .t20
                                                
                                            } else if selectedItem=="Odi"{
                                                vm.selectedFilter = .odi
                                                
                                            } else if selectedItem=="Test"{
                                                vm.selectedFilter = .test
                                                
                                            }
                                        }
                                        isOpen=false
                                    }
                                }
                                
                            }
                            Text("Sort")
                                .foregroundColor(Color.init(hex: "#283E51"))
                                .bold()
                            HStack{
                                ForEach(0..<matchTime.count, id:\.self){item in
                                    FilterButton(text: matchTime[item], selectedItem: $vm.selectedItem){
                                        if let selectedItem=vm.selectedItem{
                                            if selectedItem=="Newest"{
                                                vm.selectedFilter = .newest
                                            } else if selectedItem=="Oldest"{
                                                vm.selectedFilter = .oldest
                                            }
                                        }
                                        isOpen=false
                                    }
                                }
                            }
                            Text("Match Results")
                                .foregroundColor(Color.init(hex: "#283E51"))
                                .bold()
                            HStack{
                                ForEach(0..<matchStatus.count, id:\.self){item in
                                    FilterButton(text: matchStatus[item], selectedItem: $vm.selectedItem){
                                        if let selectedItem=vm.selectedItem{
                                            if selectedItem=="Finished"{
                                                vm.selectedFilter = .finished
                                            } else if selectedItem=="Not Started"{
                                                vm.selectedFilter = .notStarted
                                            }
                                        }
                                        isOpen=false
                                    }
                                }
                            }
                            VStack{
                                
                            }
                            .frame(height:20)
                            
                        }
                        .padding(.leading,20)
                    }
                    
                } else {
                    Spacer()
                    ProgressView()
                        .controlSize(.large)
                        .tint(Color.init(hex: "#4B79A1"))
                        .offset(y:-UIScreen.main.bounds.width)
                }
            }.padding([.leading, .trailing],20)
        }
        }
    }
}

//#Preview {
//    MatchesInfoView()
//}

struct FilterButton:View{
    var text:String
    @Binding var selectedItem:String?
    var onTap:(()->Void)?
    var body:some View{
        Button(action: {selectedItem=text; onTap?()}) {
            Text(text)
                .font(.system(size: 12)).fontWeight(.regular)
                .foregroundColor(Color.init(hex: "#FFFFFF"))
                .padding(.all)
                .frame(height: 30)
                .background(
                    selectedItem==text ? Color.init(hex: "#4B79A1") : Color.init(hex: "#283E51")
                )
                .cornerRadius(24)
        }
    }
}
