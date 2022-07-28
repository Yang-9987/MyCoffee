//
//  BeanListItemView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/28.
//

import SwiftUI

struct BeanListItemView: View {
    let bean: Bean
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(contentsOfFile: bean.imgURL) ?? UIImage(named: bean.img)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70, alignment: .center)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 2)
                }
                .shadow(radius: 4)
                .padding(5)
            
            VStack(alignment: .leading, spacing: 5) {
                Label(bean.name, systemImage: "cup.and.saucer")
                    .font(.system(size: 15, weight: .bold, design: .serif))
                    .foregroundColor(.brown)
                Label(bean.plantPlace.PlaceName, systemImage: "globe")
                    .foregroundColor(.green)
                Label(bean.flavor, systemImage: "leaf")
                    .frame(alignment: .center)
                    .foregroundColor(.gray)
                    .font(.system(size: 10, weight: .light, design: .serif))
            }
            .font(.system(.caption, design: .serif))
            
        }
    }
}

struct BeanListItemView_Previews: PreviewProvider {
    static var previews: some View {
        BeanListItemView(bean: beans[0])
    }
}
