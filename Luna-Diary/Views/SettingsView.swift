//
//  SettingsView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-04.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var diaryModelController : DiaryModelController

    var body: some View {
        NavigationStack{
            VStack{
                Text("Settings:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                    .multilineTextAlignment(.center)
                    .offset(y:20)
                        // List of settings below
                        List {
                            Text("Notification Settings").listRowBackground(Color("entryRowColour"))
                            NavigationLink(destination: ColourPaletteView()){
                                Text("Change Colour Scheme")
                            }.listRowBackground(Color("entryRowColour"))
                            Text("Change Name").listRowBackground(Color("entryRowColour"))
                            Text("Delete All Entries").listRowBackground(Color("entryRowColour"))
                        }.listStyle(.grouped)
                        .scrollContentBackground(Visibility.hidden)
                        .background(Color("backgroundColour"))
                        Spacer()
                }.background(Color("backgroundColour")).accentColor(Color("headerItemColour"))
        }// body end
    }// NavStack ends
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
