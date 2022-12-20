//
//  TodayHeader.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-20.
//

import SwiftUI

struct TodayHeader: View {
    @State private var date = Date()

    var body: some View {
        Text("Today")
            .font(Font.custom("Holla", size: 72))
        .foregroundColor(Color("entryTextColour"))
        Text(date, style: .date)
            .font(Font.custom("Poppins-Light", size: 18))
            .foregroundColor(Color("headerItemColour"))
    }
}

struct TodayHeader_Previews: PreviewProvider {
    static var previews: some View {
        TodayHeader()
    }
}
