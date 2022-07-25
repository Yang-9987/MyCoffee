//
//  MyFavorite.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/18.
//

import SwiftUI

struct MyFavoriteView: View {
    let myFavoriteData: MyFavoriteItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(myFavoriteData.title)
                .font(.system(size: 20, weight: .semibold, design: .serif))
            HStack {
                Text(myFavoriteData.taste)
                Spacer()
                Text(date2string(Datestr: myFavoriteData.date))
            }
            .font(.system(size: 15, weight: .light, design: .serif))
        }
        .padding(10)
        .background(Material.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
    }
}

struct MyFavorite_Previews: PreviewProvider {
    static var previews: some View {
        MyFavoriteView(myFavoriteData: myFavoriteItems[0])
    }
}
