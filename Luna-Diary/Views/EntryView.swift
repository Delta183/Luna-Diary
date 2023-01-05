//
//  EntryView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI

struct EntryView: View {
    
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State var diaryEntry: DiaryModel
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
                            selection: $diaryEntry.date,
                            displayedComponents: [.date, .hourAndMinute]
                        ).labelsHidden() // This hides the given text of DatePicker
                        Spacer()
                    }.offset(y: 10) // HStack
                    .padding(.leading, 6.0)
                    
                    // This is how you pass information to objects
                    // Also formatting the passed date for only day, month and year
                    TextEditor(text: $diaryEntry.title)
                        .font(Font.custom("MADEWaffleSlab", size: 20))
                        .foregroundColor(Color("headerItemColour"))
                        .frame(height: 40.0)
                        .multilineTextAlignment(.leading)
                        .offset(y:-10)
                        .scrollContentBackground(.hidden)
                        .background(Color("headerColour"))
                }.frame(width: UIScreen.main.bounds.width, height: 150)
                    .background(Color("headerColour"))
                    .offset(y: 40)
                    .cornerRadius(15)
                    .ignoresSafeArea(edges: .top) //  This is used to ignore the safe area on top of screen
                
                // TextEditor VStack begin
                VStack {
                    // Look into putting underlines on each line
                    TextEditor(text: $diaryEntry.content)
                        .padding(.horizontal, 2.0)
                        // This must be done to put custom background
                        .scrollContentBackground(.hidden)
                        .foregroundColor(Color("entryTextColour"))
                        .font(Font.custom("YanoneKaffeesatz-Light", size: 20))
                }.padding(.horizontal, 4.0)
                .offset(y: -100)
            }.background(Color("backgroundColour"))
            .navigationBarItems(trailing:
                // NavigationBar button placed below
                HStack{
                    // Save button begin
                    Button(action: {
                        let entries = self.diaryModelController.diaryEntries
                        let index = entries.firstIndex(where: {$0.id == diaryEntry.id})
                        if index != nil{
                            // Create a new entry in the array if it is truly a new diary entry
                            self.diaryModelController.createDiaryEntry(title: diaryEntry.title, content: diaryEntry.content, date: diaryEntry.date)
                            dismiss()
                        }
                    }) {
                        Text("Save").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                    }
                }
            )
        }// Outer VStack
    } // NavigationStack end
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        // Add this to previews to be compatible to enviroment objects otherwise
        // the preview will crash
        EntryView( diaryEntry: .DummyDiaryEntry)
    }
}

