//
//  NetworkClient.swift
//  CricInfo
//
//  Created by Mohd Kashif on 16/07/24.
//

import Foundation
class NetworkClient{
    private var session:URLSession?
    var sessionConfig:URLSessionConfiguration //// url sessison configutration
    init(){
        sessionConfig=URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest=90
        sessionConfig.timeoutIntervalForResource=90
        sessionConfig.urlCache=nil
        self.session=URLSession(configuration: sessionConfig)
    }
    
    /// a single function whcih retrun matchresponse
    func getMatchesList(completion:@escaping (MatchResponse?, Error?)->Void){
        guard let url=URL(string: "https://api.cricapi.com/v1/cricScore?apikey=\(APIKey.key)") else {
            completion(nil, APIError.invalidUrl)
            return
        }
        
        let request=URLRequest(url: url)
        let dataTask=self.session?.dataTask(with: request){data, response, error in
            guard let response=response as? HTTPURLResponse else {
                completion(nil, APIError.invalidResponse("Invalid response"))
                return
            }
            guard let data=data else {
                completion(nil, APIError.invalidData)
                return
            }
            
            if response.statusCode==200{
                do {
                    let decodedData=try JSONDecoder().decode(MatchResponse.self, from: data)
                    completion(decodedData, nil)
                } catch let error{
                    print(error,"serailaization error")
                    completion(nil, APIError.failedSerailization(error.localizedDescription))
                }
            }
        }
        dataTask?.resume()
    }
}
