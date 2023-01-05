//
//  UpdateEntry.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-04.
//

import SwiftUI

struct UpdateEntry: View {
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State var diaryEntry: DiaryModel
    @State var originalEntry: DiaryModel
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
                        ).labelsHidden()
                        Spacer()
                    }.offset(y: 10)
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
                //  This is used to ignore the safe area on top of screen
                    .ignoresSafeArea(edges: .top)
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
            // .navigationBarBackButtonHidden(true)
            // NavigationBar button placed below
            .navigationBarItems(trailing:
            HStack{
                // Save button begin
                Button(action: {
                    let entries = self.diaryModelController.diaryEntries
                    let index = entries.firstIndex(where: {$0.id == diaryEntry.id})
                    if index != nil{
                        if entries[index!] == diaryEntry {
                            // print("First")
                            dismiss()
                        }
                        else{
                            // print("boi")
                            self.diaryModelController.updateDiaryEntry(diaryEntry: diaryEntry, index: index!)
                            dismiss()
                        }
                    }
                }) {
                    Text("Save").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                }
                Button(action: {
                  // Revert text
                    diaryEntry.title = originalEntry.title
                    diaryEntry.content = originalEntry.content
                    diaryEntry.date = originalEntry.date
                }) {
                    Text("Revert").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                }
            })
            
        }.navigationBarBackButtonHidden(true)// Outer VStack
    } // NavigationStack end
}

struct UpdateEntry_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEntry(diaryEntry: .DummyDiaryEntry, originalEntry: .DummyDiaryEntry)
    }
}
