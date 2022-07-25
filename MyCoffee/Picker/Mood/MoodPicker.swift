//
//  MoodPicker.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/24.
//

import SwiftUI

struct MoodPicker: View {
    @Binding var moodSeclection: Mood
    
    var body: some View {
        Picker("Mood", selection: $moodSeclection, content: {
            ForEach(Mood.allCases) { mood in
                MoodView(mood: mood)
                    .tag(mood)
            }
        })
    }
}

struct MoodPicker_Previews: PreviewProvider {
    static var previews: some View {
        MoodPicker(moodSeclection: .constant(.Happy))
    }
}
