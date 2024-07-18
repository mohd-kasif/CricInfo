//
//  HomeScreen.swift
//  CricInfo
//
//  Created by Mohd Kashif on 16/07/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var isSplash:Bool=false
    @State var scaleAmount:CGFloat=1
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            if isSplash{
                MatchesInfoView()
            } else {
                Image("Splash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scaleAmount)
                    .frame(width:100)
            }
            
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 1)){
                scaleAmount=0.5
            }
            withAnimation(.easeInOut(duration: 1).delay(1)){
                scaleAmount=80
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                self.isSplash=true
            }
        }
        
    }
}

//#Preview {
//    HomeScreen()
//}
