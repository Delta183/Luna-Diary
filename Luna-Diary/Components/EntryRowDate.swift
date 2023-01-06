//
//  EntryRowDate.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-01.
//

import SwiftUI

// Identical to Entry Row but includes the date in this instance
struct EntryRowDate: View {
    @EnvironmentObject var csController: ColourSchemeController
    var diaryEntry: DiaryModel

    var body: some View {
        VStack {
            let dateString = getShortStringFromDate(date: diaryEntry.date)
            Color("backgroundColour")
            VStack(alignment: .leading) {
                HStack {
                    Text(diaryEntry.title)
                            .font(Font.custom("YanoneKaffeesatz-Bold", size: 20))
                            .foregroundColor(Color(hex: csController.entryTextColour))
                            .lineLimit(1)
                            .padding([.top, .leading], 4.0)
                        .padding(.bottom, 1.0)
                    Spacer()
                    Text(dateString)
                            .font(Font.custom("YanoneKaffeesatz-Bold", size: 20))
                            .foregroundColor(Color(hex: csController.entryTextColour))
                            .lineLimit(1)
                            .padding(.top, 4.0)
                            .padding(.trailing, 6)
                        .padding(.bottom, 1.0)
                }
                        
                Text(diaryEntry.content)
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .font(Font.custom("YanoneKaffeesatz-Light", size: 20))
                        .lineLimit(1)
                        .padding([.leading, .bottom], 4.0)
                }.background(Color(hex: csController.headerColour))
            Color(hex: csController.backgroundColour)
        }.frame(height: 60)
        .background(Color(hex: csController.backgroundColour))
        
    }
}

struct EntryRowDate_Previews: PreviewProvider {
    static var previews: some View {
        EntryRowDate(diaryEntry: DiaryModel(title: "Steps to achieve Heaven", content: "Spiral staircase, Rhinoceros beetle, Desolation Row", date: Date()))
    }
}


