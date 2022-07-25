//
//  changeTodayDataView.swift
//  MyCoffee
//
//  Created by Yang Jianqi on 2022/7/24.
//

import SwiftUI

struct changeTodayDataView: View {
    @Binding var data: TodayReview
    
    var body: some View {
        Form {
            Section(header: Text("Today's")) {
                VStack {
                    MoodPicker(moodSeclection: $data.mood)
                }
                
                HStack {
                    Text("Cups:")
                        .font(.title3)
                    TextField("title", value: $data.cupsCoffee, formatter: NumberFormatter())
                }
                
                HStack {
                    Text("BeanStorage(g):")
                        .font(.title3)
                    TextField("weight", value: $data.beanStorage, formatter: NumberFormatter())
                }
            }
        }
    }
    
}

struct changeTodayDataView_Previews: PreviewProvider {
    static var previews: some View {
        changeTodayDataView(data: .constant(todayReviews[0]))
    }
}
