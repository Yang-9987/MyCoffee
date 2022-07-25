//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Yang Jianqi on 2022/6/13.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("logo")
            .antialiased(true)
            .resizable()
            .scaledToFit()
            .scaleEffect(1.5, anchor: .center)
            .ignoresSafeArea(.all)
            .hueRotation(Angle.degrees(5))
            .shadow(radius: 5)
            .blur(radius: 2)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
