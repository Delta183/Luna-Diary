//
//  EntryRow.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-15.
//

import SwiftUI

struct EntryRow: View {
    
    var diaryEntry: DiaryModel
    
    var body: some View {
        VStack {
            Color("backgroundColour")
            VStack(alignment: .leading) {
                Text(diaryEntry.title)
                        .font(Font.custom("YanoneKaffeesatz-Bold", size: 20))
                        .foregroundColor(Color("entryTextColour"))
                        .lineLimit(1)
                        .padding([.top, .leading], 4.0)
                        .padding(.bottom, 1.0)
                Text(diaryEntry.content)
                        .foregroundColor(Color("entryTextColour"))
                        .font(Font.custom("YanoneKaffeesatz-Light", size: 20))
                        .lineLimit(1)
                        .padding([.leading, .bottom], 4.0)
                    
                }.background(Color("headerColour"))
            Color("backgroundColour")
        }.frame(height: 60)
        .background(Color("backgroundColour"))
        
    }
}

struct EntryRow_Previews: PreviewProvider {
    static var previews: some View {
        EntryRow(diaryEntry: DiaryModel(title: "Steps to achieve Heaver", content: "Spiral staircase, Rhinoceros beetle, Desolation Row", date: Date()))
    }
}
