//
//  ContentView.swift
//  GridCalendar
//
//  Created by Yasin Şükrü Tan on 24.11.2022.
//

import SwiftUI

struct CalendarGridView: View {
    let layout = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders]) {
                ForEach(year, id: \.name) { month in
                    Section(header: Text(verbatim: month.name).font(.headline)) {
                        ForEach(month.days) { day in
                            Capsule()
                                .overlay(Text("\(day.value)").foregroundColor(.white))
                                .foregroundColor(.blue)
                                .frame(height: 40)
                        }
                    }
                }
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
    }
}

struct CalendarGridView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarGridView()
    }
}
