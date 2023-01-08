//
//  NameChangeView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-06.
//

import SwiftUI

struct NameChangeView: View {
    @EnvironmentObject var userNameController: UserNameController
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var name: String = ""
    @State private var showingAlert = false


    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:3)
                Text("Change your name below:")
                    .font(Font.custom("San Francisco" , fixedSize: 24).bold())
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                TextField("Enter your name", text: $name) .font(Font.custom("MADEWaffleSlab", fixedSize: 20))
                    .foregroundColor(Color(hex: csController.headerItemColour))
                    .multilineTextAlignment(.center)
                    .scrollContentBackground(.hidden)
                    .background(Color(hex: csController.headerColour))
                Button("Save Name") {
                    // Set the name to the userDefaults
                    userNameController.changeName(name: name)
                    showingAlert.toggle()
                }.buttonStyle(ThemeButton())
                    .font(Font.custom("San Francisco" , fixedSize: 16))
                    .alert(isPresented: $showingAlert) {
                            Alert(title: Text("New name successfully saved!"), dismissButton: .default(Text("OK")))
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
