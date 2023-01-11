//
//  CreditsView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-11.
//

import SwiftUI

struct CreditsView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:1)
                Text("Credits")
                    .font(Font.custom("Holla", fixedSize: 56))
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                    .offset(y:-20)
                Text("Developer: Daniel Figueroa")
                    .font(.system(size: 20).bold())
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                    .offset(y:-20)
                Text("UI Designer: Selene Camarillo")
                    .font(.system(size: 20).bold())
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                    .offset(y:-20)
                Text("Artist: Gabriela Zapata")
                    .font(.system(size: 20).bold())
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                    .offset(y:-20)
                Spacer()
            }.background(Color(hex: csController.backgroundColour))
        }.accentColor(Color(hex: csController.entryTextColour))
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
