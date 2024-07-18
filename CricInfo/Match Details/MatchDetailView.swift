//
//  MatchDetailView.swift
//  CricInfo
//
//  Created by Mohd Kashif on 18/07/24.
//

import SwiftUI

struct MatchDetailView: View {
    let matchinfo:MatchesList
    var body: some View {
            ZStack{
                Color.init(hex: "#FFFFFF").ignoresSafeArea()
                VStack(alignment: .center, spacing: 5){
                    HStack{
                        Spacer()
                        Text("Series")
                            .bold()
                            .font(.system(size: 24))
                        Spacer()
                        Text(matchinfo.matchType ?? "")
                            .bold()
                            .font(.system(size: 18))
                            .italic()
                            .padding(.trailing,10)
                    }
                    .padding(.top,10)
                   
                    Text(matchinfo.series ?? "")
                        .font(.system(size: 18))
                    Text("Time and Date")
                        .bold()
                        .font(.system(size: 24))
                    if let date=matchinfo.dateTimeGMT?.dateFormmater(){
                        Text(date)
                            .font(.system(size: 18))
                    }
                    Text("Teams")
                        .bold()
                        .font(.system(size: 24))
                    HStack{
                        Text(matchinfo.t1 ?? "")
                            .font(.system(size: 18))
                            .frame(maxWidth:.infinity, alignment: .center)
                        Text("Vs")
                            .italic()
                            .font(.system(size: 16))
                        Text(matchinfo.t2 ?? "")
                            .font(.system(size: 18))
                            .frame(maxWidth:.infinity, alignment: .center)
                    }
                    HStack{
                        AsyncImage(url: URL(string: matchinfo.t1img ?? ""), content: {image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.trailing,60)
                        }, placeholder: {
                            ProgressView()
                        })
                        AsyncImage(url: URL(string: matchinfo.t2img ?? ""), content: {image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.leading,60)
                        }, placeholder: {
                            ProgressView()
                        })
                    }
                    HStack{
                        Text(matchinfo.t1s ?? "")
                            .font(.system(size: 18))
                            .padding(.trailing,60)
                        Text(matchinfo.t2s ?? "")
                            .font(.system(size: 18))
                            .padding(.leading,60)
                    }
                    Text("Status")
                        .bold()
                        .font(.system(size: 24))
                    Text(matchinfo.status ?? "")
                        .font(.system(size: 18))
                        .padding(.bottom,10)
                    
                }
                .background(Color.init(hex: "#FFFAF0"))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .padding([.leading,.trailing],20)
                .shadow(radius: 10)
            }
            .navigationTitle("Match Details")

    }
}

//#Preview {
//    MatchDetailView()
//}
