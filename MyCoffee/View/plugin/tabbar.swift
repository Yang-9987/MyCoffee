//
//  tabbar.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/12.
//

import Foundation
import SwiftUI

struct BottomBar: View {
    @Binding var selectedTab: Tab
    @State private var showingAlert = false
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            ForEach(tabItems) { tabItem in
                Button(action: {
                    if tabItem.type == .TabType {
                        withAnimation(.easeInOut) {
                            selectedTab = tabItem.tab!
                        }
                    } else {
                        showingAlert = true
                    }
                }) {
                    if tabItem.type == .TabType {
                        VStack(spacing: 0) {
                            Image(systemName: tabItem.icon)
                                .symbolVariant(.fill)
                                .font(.system(size: 30))
                                .frame(width: 44, height: 40)
                            Text(tabItem.text)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .shadow(color: .white, radius: 10)
                        .background(Color.clear)
                    }
                }
                .foregroundColor(selectedTab == tabItem.tab ? Color("TabBarBG") : .secondary)
                .frame(maxWidth: .infinity)
                Spacer()
            }
        }
        .frame(height: 90, alignment: .top)
        .padding(.horizontal, 2)
        .padding(.top, 15)
        .background(Material.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar(selectedTab: .constant(.home))
            .previewLayout(.sizeThatFits)
    }
}
