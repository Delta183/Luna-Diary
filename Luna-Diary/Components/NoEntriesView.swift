//
//  NoEntriesView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-15.
//

import SwiftUI

// The view is nothing complex, just a component to be called when no entries appear in ContentView
struct NoEntriesView: View{
    @EnvironmentObject var csController: ColourSchemeController

    var body: some View{
        Image("peng1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300.0, height: 300.0)
        Text("No Entries... Yet.")
            .font(Font.custom("Holla", fixedSize: 48).bold())
            .foregroundColor(Color(hex: csController.entryTextColour))
    }
}
struct NoEntriesView_Previews: PreviewProvider {
    static var previews: some View {
        NoEntriesView()
    }
}
