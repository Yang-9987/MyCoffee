//
//  MoodView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/24.
//

import SwiftUI

struct MoodView: View {
    let mood: Mood
    
    var body: some View {
        HStack {
            Text(mood.moodName)
            Text(mood.moodImg)
        }
        .padding(5)
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView(mood: .Happy)
    }
}
