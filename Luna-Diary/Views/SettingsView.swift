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
                    .frame(height:3)
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                    .offset(y:20)
                        // List of settings below
                        List {
                            Text("Notification Settings").listRowBackground(Color(hex: csController.entryRowColour)).foregroundColor(Color(hex: csController.entryTextColour))
                            NavigationLink(destination: ColourPaletteView()){
                                Text("Change Colour Scheme").foregroundColor(Color(hex: csController.entryTextColour))
                            }.listRowBackground(Color(hex: csController.entryRowColour))
                            Text("Change Name").listRowBackground(Color(hex: csController.entryRowColour)).foregroundColor(Color(hex: csController.entryTextColour))
                            Text("Delete All Entries").listRowBackground(Color(hex: csController.entryRowColour)).foregroundColor(Color(hex: csController.entryTextColour))
                        }.listStyle(.grouped)
                        .scrollContentBackground(Visibility.hidden)
                        .background(Color(hex: csController.backgroundColour))
                        Spacer()
                }.background(Color(hex: csController.backgroundColour))
        }// body end
    }// NavStack ends
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
