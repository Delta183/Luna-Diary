//
//  SettingsView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-04.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController

    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:5)
                Text("Settings:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: csController.headerItemColour))
                    .multilineTextAlignment(.center)
                    .offset(y:20)
                        // List of settings below
                        List {
                            Text("Notification Settings").listRowBackground(Color(hex: csController.entryRowColour))
                            NavigationLink(destination: ColourPaletteView()){
                                Text("Change Colour Scheme")
                            }.listRowBackground(Color(hex: csController.entryRowColour))
                            Text("Change Name").listRowBackground(Color(hex: csController.entryRowColour))
                            Text("Delete All Entries").listRowBackground(Color(hex: csController.entryRowColour))
                        }.listStyle(.grouped)
                        .scrollContentBackground(Visibility.hidden)
                        .background(Color(hex: csController.backgroundColour))
                        Spacer()
                }.background(Color(hex: csController.backgroundColour)).accentColor(Color(hex: csController.headerItemColour))
        }// body end
    }// NavStack ends
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
