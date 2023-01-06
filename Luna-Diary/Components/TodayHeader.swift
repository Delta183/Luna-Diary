//
//  TodayHeader.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-20.
//

import SwiftUI

struct TodayHeader: View {
    @EnvironmentObject var csController: ColourSchemeController

    @State var date = Date()
    // date = Calendar.current.date(byAdding: .day, value: -7, to: Date())
    
    
    var body: some View {
        Text("Today")
            .font(Font.custom("Holla", size: 72))
        .foregroundColor(Color(hex: csController.entryTextColour))
        Text(date, style: .date)
            .font(Font.custom("Poppins-Light", size: 18))
            .foregroundColor(Color(hex: csController.entryTextColour))
    }
}

struct TodayHeader_Previews: PreviewProvider {
    static var previews: some View {
        TodayHeader()
    }
}
