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
            // Calling a Color on its own creates a component of it which is used to make the frame of the entries and in turn,
            // create the illusion of a list
            Color(hex: csController.backgroundColour)
            VStack(alignment: .leading) {
                // Only the title is in a HStack in order to ensure that it is moved to the left rather than center
                HStack {
                    Text(diaryEntry.title)
                            .font(Font.custom("YanoneKaffeesatz-Bold", fixedSize: 20))
                            .foregroundColor(Color(hex: csController.entryTextColour))
                            .lineLimit(1)
                            .padding([.top, .leading], 4.0)
                        .padding(.bottom, 1.0)
                    // This Spacer is what pushes the empty space if applicable
                    Spacer()
                }
                        
                Text(diaryEntry.content)
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .font(Font.custom("YanoneKaffeesatz-Light", fixedSize: 20))
                        .lineLimit(1)
                        .padding([.leading, .bottom], 4.0)
                }.background(Color(hex: csController.entryRowColour))
            // The other color object that will be at the bottom to simulate a gap in the list
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
