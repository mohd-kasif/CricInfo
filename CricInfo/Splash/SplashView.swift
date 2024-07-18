//
//  SplashView.swift
//  CricInfo
//
//  Created by Mohd Kashif on 16/07/24.
//

import SwiftUI

struct SplashView: View {
    @State var scaleAmount:CGFloat=1
    var body: some View {
        
        ZStack{
            Color.white.ignoresSafeArea()
                Image("Splash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scaleAmount)
                    .frame(width:150)
          
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 1)){
                scaleAmount=0.5
            }
            withAnimation(.easeInOut(duration: 1).delay(1)){
                scaleAmount=50
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                
            }
        }
    }
}

//#Preview {
//    SplashView()
//}
