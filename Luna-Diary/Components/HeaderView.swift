//
//  HeaderView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-05.
//

import SwiftUI

// This is a view that displays on the top of the screen as a sort of custom header
struct HeaderView: View {
    @EnvironmentObject var csController: ColourSchemeController
    var body: some View {
        HStack {
            Image(systemName: "square.and.pencil")
                .resizable()
                .frame(width: 28.0, height: 28.0)
                .padding(.leading, 12.0)
                .foregroundColor(Color(hex: csController.headerItemColour))
            Text("(username)'s Journal")
                .font(Font.custom("MADEWaffleSlab", size: 16))
                .foregroundColor(Color(hex: csController.headerItemColour))
            Spacer()
            Button(action: {
                print("button pressed")
            }) {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 28.0, height: 28.0)
                    .padding(.trailing, 12.0)
                    .foregroundColor(Color(hex: csController.headerItemColour))
            }
        }.frame(width: UIScreen.main.bounds.width, height: 150)
        .offset(y:40)
        .background(Color(hex: csController.headerColour))
        .cornerRadius(15)
        //  This is used to ignore the safe area on top of screen
        .ignoresSafeArea(edges: .top)
        // header end
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
