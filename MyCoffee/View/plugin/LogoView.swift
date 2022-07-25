//
//  LogoView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/12.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack {
            Text("MyCoffee")
                .font(.system(size: 30, weight: .thin, design: .serif))
                .foregroundColor(.black)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
