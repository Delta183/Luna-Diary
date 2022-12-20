//
//  EntryView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI

struct EntryView: View {
    
    @ObservedObject var diaryModelController: DiaryModelController
    @State private var date = Date()
    // Placeholder for the entry title
    @State private var entryTitle = "[New Entry]"
    // Place holder text for the entry
    @State private var content = "Enter text here..."
    
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
                        Text("On:").font(Font.custom("MADEWaffleSlab", size: 16))
                            .foregroundColor(Color("entryTextColour"))
                        DatePicker(
                                "",
                                 selection: $date,
                                 displayedComponents: [.date, .hourAndMinute]
                        ).labelsHidden()
                        Spacer()
                    }.offset(y: 10)
                    .padding(.leading, 6.0)
                    // This is how you pass information to objects
                    // Also formatting the passed date for only day, month and year
                    TextEditor(text: $entryTitle)
                        .font(Font.custom("MADEWaffleSlab", size: 20))
                        .foregroundColor(Color("headerItemColour"))
                        .frame(height: 40.0)
                        .multilineTextAlignment(.leading)
                        .offset(y:-10)
                        .scrollContentBackground(.hidden)
                        .background(Color("headerColour"))
                }.frame(width: .infinity, height: 150)
                    .background(Color("headerColour"))
                    .offset(y: 40)
                    .cornerRadius(15)
                //  This is used to ignore the safe area on top of screen
                    .ignoresSafeArea(edges: .top)
                // TextEditor VStack begin
                VStack {
                    // Look into putting underlines on each line
                    TextEditor(text: $content)
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
                // Add the entry to the arrays here
                self.diaryModelController.createDiaryEntry(title: entryTitle, content: self.content, date: self.date)
                print("Diary Entry Added!")
                // dismiss()
            }) {
                Text("Save").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                }
           )
        }// Outer VStack
    } // NavigationStack end
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        // Add this to previews to be compatible to enviroment objects otherwise
        // the preview will crash
        EntryView(diaryModelController: DiaryModelController())
    }
}

