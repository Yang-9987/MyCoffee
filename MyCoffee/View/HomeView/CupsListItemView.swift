//
//  CupsListItemView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/24.
//

import SwiftUI

struct CupsListItemView: View {
    let data: CupCoffee
    
    @State var icon: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "cup.and.saucer")
            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.system(size: 25, weight: .medium, design: .serif))
                Text(data.shop)
                    .font(.system(size: 15, weight: .light, design: .serif))
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(String(data.score))
                    .font(.system(size: 25, weight: .medium, design: .serif))
                Text(data.comment)
                    .font(.system(size: 15, weight: .light, design: .serif))
            }
            Image(systemName: "arrow.forward")
                .padding(.leading, 10)
        }
        .padding()
    }
}

struct CupsListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CupsListItemView(data: cupCoffees[0])
    }
}
