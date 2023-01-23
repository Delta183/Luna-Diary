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
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:3)
                Text("Settings")
                    .font(Font.custom("Holla", fixedSize: 56))
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                    .frame(height: 60)
                // List of settings below which are hardcoded as there really won't be manny
                List {
                    // Text("Notification Settings").listRowBackground(Color(hex: csController.entryRowColour)).foregroundColor(Color(hex: csController.entryTextColour))
                    
                    // Change Colour Scheme
                    NavigationLink(destination: ColourPaletteView()){
                        Text("Change Colour Scheme")
                            .foregroundColor(Color(hex: csController.entryTextColour))
                            .font(Font.custom("San Francisco" , fixedSize: 16).bold())
                    }.listRowBackground(Color(hex: csController.entryRowColour))
                    
                    // Change Name
                    NavigationLink(destination: NameChangeView()){
                        Text("Change Name")
                            .foregroundColor(Color(hex: csController.entryTextColour))
                            .font(Font.custom("San Francisco" , fixedSize: 16).bold())
                    }.listRowBackground(Color(hex: csController.entryRowColour))
                   
                    // Delete All Entries
                    NavigationLink(destination: DeleteEntriesView()){
                        Text("Delete All Entries")
                            .foregroundColor(Color(hex: csController.entryTextColour))
                            .font(Font.custom("San Francisco" , fixedSize: 16).bold())
                    }.listRowBackground(Color(hex: csController.entryRowColour))
                    NavigationLink(destination: CreditsView()){
                        Text("Credits").foregroundColor(Color(hex: csController.entryTextColour)).font(Font.custom("San Francisco" , fixedSize: 16).bold())
                    }.listRowBackground(Color(hex: csController.entryRowColour))
                    
                }.listStyle(.grouped)
                .scrollContentBackground(Visibility.hidden)
                .background(Color(hex: csController.backgroundColour))
                // List end
                Spacer()
            }.background(Color(hex: csController.backgroundColour))
        }.accentColor(Color(hex: csController.entryTextColour))
    }// NavStack ends
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
