//
//  EntryRow.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-15.
//

import SwiftUI

struct EntryRow: View {
    @EnvironmentObject var csController: ColourSchemeController
    var diaryEntry: DiaryModel
    
    var body: some View {
        VStack {
            Color(hex: csController.backgroundColour)
            VStack(alignment: .leading) {
                HStack {
                    Text(diaryEntry.title)
                            .font(Font.custom("YanoneKaffeesatz-Bold", size: 20))
                            .foregroundColor(Color(hex: csController.entryTextColour))
                            .lineLimit(1)
                            .padding([.top, .leading], 4.0)
                        .padding(.bottom, 1.0)
                    Spacer()
                }
                        
                Text(diaryEntry.content)
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .font(Font.custom("YanoneKaffeesatz-Light", size: 20))
                        .lineLimit(1)
                        .padding([.leading, .bottom], 4.0)
                }.background(Color(hex: csController.entryRowColour))
            Color(hex: csController.backgroundColour)
        }.frame(height: 60)
        .background(Color(hex: csController.backgroundColour))
        
    }
}

struct EntryRow_Previews: PreviewProvider {
    static var previews: some View {
        EntryRow(diaryEntry: DiaryModel(title: "Steps to achieve Heaven", content: "Spiral staircase, Rhinoceros beetle, Desolation Row", date: Date()))
    }
}
