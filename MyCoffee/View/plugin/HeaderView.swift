//
//  SwiftUIView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/12.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var set: setData
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image("coffeebean")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .padding(10)
            })
            .frame(width: 80)
            
            Spacer()
            
            LogoView()
            
            Spacer()
            
            Button(action: {}, label: {
              ZStack {
                Image(systemName: "questionmark.circle")
                      .font(.system(size: 30, weight: .thin))
                  .foregroundColor(.black)
              }
            })
            .frame(width: 80)
        }
        .frame(height:60)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(setData())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
