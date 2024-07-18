//
//  MatchCard.swift
//  CricInfo
//
//  Created by Mohd Kashif on 16/07/24.
//

import SwiftUI

struct MatchCard: View {
    let date:String
    let matchType:String
    let result:String
    let team1:String
    let team2:String
    let score1:String
    let score2:String
    let team1url:String
    let team2url:String
    var body: some View {

            VStack{
                HStack{
                    if let formatString=date.dateFormmater() {
                        Text(formatString)
                    }
                    Spacer()
                    Text(matchType)
                }
                .padding()
                HStack{
                    VStack{
                        Text(team1)
                            .multilineTextAlignment(.center)
                        AsyncImage(url: URL(string: team1url), content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                            
                        }, placeholder: {
                            ProgressView()
                        })
                    Text(score1)
                    }
                    Spacer()
                    Text("Vs")
                        .font(.system(size: 30))
                        .italic()
                    Spacer()
                    VStack{
                        Text(team2)
                            .multilineTextAlignment(.center)
//                            .fixedSize()
                        AsyncImage(url: URL(string: team2url), content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                            
                        }, placeholder: {
                            ProgressView()
                        })
                        Text(score2)
                    }
                }
                .padding()
                Text("Status:- \(result)")
                    .padding()
            }
            .foregroundStyle(.white)
//            .frame(width:350, height:200)
            .background{
//                #93A5CF → #E4EfE9
                LinearGradient(colors: [Color.init(hex: "#4B79A1"),Color.init(hex: "#283E51")], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(radius: 10)
        
     
    }
}

//#Preview {
//    MatchCard(date: "2024-07-14T10:30:00", matchType: "t20", result: "Trichy Grand Cholas won by 35 runs", team1: "Salem Spartans [SLST", team2: "Trichy Grand Cholas", score1: "163/10 (18.3)", score2: "198/5 (20)")
//}


