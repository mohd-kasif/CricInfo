//
//  MatchInfoModel.swift
//  CricInfo
//
//  Created by Mohd Kashif on 16/07/24.
//

import Foundation
/*
 {
   "apikey": "476f56b5-b4cc-405b-af52-7467bbaab2f1",
   "data": [
     {
       "id": "c0c25377-085b-4c1d-945d-b4eca9bdf546",
       "dateTimeGMT": "2024-07-23T08:30:00",
       "matchType": "t20",
       "status": "Match not started",
       "ms": "fixture",
       "t1": "Pakistan Women [PAKW]",
       "t2": "United Arab Emirates Women [UAEW]",
       "t1s": "",
       "t2s": "",
       "t1img": "https://g.cricapi.com/iapi/67-637877074931980375.webp?w=48",
       "t2img": "https://g.cricapi.com/iapi/1136-637877081374906304.webp?w=48",
       "series": "Womens Asia Cup T20, 2024"
     },
 */


struct MatchResponse:Codable{
    var data:[MatchesList]
}

struct MatchesList:Codable,Identifiable{
    let id:String
    let dateTimeGMT:String?
    let matchType:String?
    let status:String?
    let ms:String?
    let t1:String?
    let t2:String?
    let t1s:String?
    let t2s:String?
    let t1img:String?
    let t2img:String?
    let series:String?
}
