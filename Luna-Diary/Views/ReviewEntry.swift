//
//  ReviewEntry.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-15.
//

import SwiftUI

struct ReviewEntry: View {
    @State private var date = Date()
    // Place holder text for the entry
    @State private var profileText = "Enter text here..."
    // Placeholder for the entry title
    @State private var entryTitle = "[New Entry]"
    // boolean for the confrimation dialog
    // @State private var confirmationShown = false // Unused
    // boolean for review or creation mode
    // @State private var inReviewMode = false // Unused
    // Needed for dismissing view
    @Environment(\.dismiss) var dismiss
  
    var body: some View {
        
        NavigationStack{
            VStack {
                // header VStack
                VStack{
                    HStack {
                        Text(date, style: .date)
                            .font(Font.custom("MADEWaffleSlab", size: 16))
                            .foregroundColor(Color("entryTextColour"))
                            .multilineTextAlignment(.leading)
                        Text(date, style: .time)
                            .font(Font.custom("MADEWaffleSlab", size: 16))
                            .foregroundColor(Color("entryTextColour"))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(.leading, 6.0)
                    // This is how you pass information to objects
                    // Also formatting the passed date for only day, month and year
                    HStack {
                        Text(entryTitle)
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
                // TextEditor VStack begin
                VStack {
                    // Look into putting underlines on each line
                    TextEditor(text: $profileText)
                        .padding(.horizontal, 2.0)
                        // This must be done to put custom background
                        .scrollContentBackground(.hidden)
                        .foregroundColor(Color("entryTextColour"))
                        .font(Font.custom("YanoneKaffeesatz-Light", size: 20))
                }.padding(.horizontal, 4.0)
                .offset(y: -100)
            }.background(Color("backgroundColour"))
            // NavigationBar button placed below
            .navigationBarItems(trailing: Button(action: {
                // Action for the navbar button here
                print("Edit button pressed...")
            }) {
                Text("Edit").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                }
           )
        }// Outer VStack
    } // NavigationStack end
}

struct ReviewEntry_Previews: PreviewProvider {
    static var previews: some View {
        ReviewEntry()
    }
}
