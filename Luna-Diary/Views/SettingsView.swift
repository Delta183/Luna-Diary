//
//  SettingsView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-04.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var diaryModelController : DiaryModelController
    // @StateObject var debounceObject = DebounceObject()
    @State private var readyToNavigate : Bool = false
    

    var body: some View {
            VStack{
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                    .multilineTextAlignment(.center)
                    .offset(y:20)
                NavigationStack{
                        List {
                            Text("Notification Settings").listRowBackground(Color("entryRowColour"))
                            Text("Change Colour Scheme").listRowBackground(Color("entryRowColour"))
                            Text("Change Name").listRowBackground(Color("entryRowColour"))
                            Text("Delete All Entries").listRowBackground(Color("entryRowColour"))
                        }.listStyle(.grouped)
                        .scrollContentBackground(Visibility.hidden)
                        .background(Color("backgroundColour"))
                        Spacer()
                    }// NavStack ends
                }.background(Color("backgroundColour")).accentColor(Color("headerItemColour"))
        }// body end
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
