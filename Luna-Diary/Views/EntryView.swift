//
//  EntryView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI

struct EntryView: View {
    // Place holder text for the entry
    @State private var profileText = "Enter text here..."
    // boolean for the confrimation dialog
    @State private var confirmationShown = false
    // Needed for dismissing view
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            // header stack
            VStack{
                HStack {
                    Text("On \(Date().formatted(.dateTime.day().month().year()))")
                        .font(Font.custom("MADEWaffleSlab", size: 20))
                        .foregroundColor(Color("entryTextColour"))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading, 6.0)
                // This is how you pass information to objects
                // Also formatting the passed date for only day, month and year
                HStack {
                    Text("[New Entry]")
                        .font(Font.custom("MADEWaffleSlab", size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("headerItemColour"))
                        .multilineTextAlignment(.leading)
                    Spacer()
                    // currentDateObject.date
                }.padding(.leading, 6.0)
            }.frame(width: .infinity, height: 150)
                .background(Color("headerColour"))
                .offset(y: 40)
                .cornerRadius(15)
            //  This is used to ignore the safe area on top of screen
                .ignoresSafeArea(edges: .top)
            VStack {
                // Look into putting underlines on each line
                TextEditor(text: $profileText)
                    .padding(.horizontal, 2.0)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(Color("entryTextColour"))
                    .font(Font.custom("YanoneKaffeesatz-Light", size: 20))

            }.padding(.horizontal, 4.0)
            .offset(y: -50)
        }.background(Color("backgroundColour")) // Vstack end
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        // Add this to previews to be compatible to enviroment objects otherwise
        // the preview will crash
        EntryView()
    }
}
