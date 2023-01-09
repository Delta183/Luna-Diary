//
//  TodayHeader.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-20.
//

import SwiftUI

struct TodayHeader: View {
    @EnvironmentObject var csController: ColourSchemeController
    // Date() gets the current date in a Date object
    @State var date = Date()
    
    var body: some View {
        Text("Today")
            .font(Font.custom("Holla", fixedSize: 72))
        .foregroundColor(Color(hex: csController.entryTextColour))
        Text(date, style: .date)
            .font(Font.custom("Poppins-Light", fixedSize: 18))
            .foregroundColor(Color(hex: csController.entryTextColour))
    }
}

struct TodayHeader_Previews: PreviewProvider {
    static var previews: some View {
        TodayHeader()
    }
}
