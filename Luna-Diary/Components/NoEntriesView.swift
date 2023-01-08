//
//  NoEntriesView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-15.
//

import SwiftUI

struct NoEntriesView: View{
    @EnvironmentObject var csController: ColourSchemeController

    var body: some View{
        Image("peng1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300.0, height: 300.0)
        Text("No Entries... Yet.")
            .font(Font.custom("Holla", fixedSize: 48))
            .fontWeight(.bold)
            .foregroundColor(Color(hex: csController.headerItemColour))
    }
}
struct NoEntriesView_Previews: PreviewProvider {
    static var previews: some View {
        NoEntriesView()
    }
}
