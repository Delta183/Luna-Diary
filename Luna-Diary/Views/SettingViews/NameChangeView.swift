//
//  NameChangeView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-06.
//

import SwiftUI

struct NameChangeView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var name: String = ""
    @State private var buttonPressed: Bool = false

    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:3)
                Text("Change your name below:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                TextField("Enter your name", text: $name) .font(Font.custom("MADEWaffleSlab", size: 20))
                    .foregroundColor(Color(hex: csController.headerItemColour))
                    .multilineTextAlignment(.center)
                    .scrollContentBackground(.hidden)
                    .background(Color(hex: csController.headerColour))
                Button("Save Name") {
                    // Set the name to the userDefaults
                    UserDefaults.standard.set(name, forKey: "userName")
                    buttonPressed.toggle()
                }.buttonStyle(ThemeButton())
                if buttonPressed {
                    Text("New Name Saved!").font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }.background(Color(hex: csController.backgroundColour))
        }
    }
}

struct NameChangeView_Previews: PreviewProvider {
    static var previews: some View {
        NameChangeView()
    }
}
