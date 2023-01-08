//
//  UpdateEntry.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-04.
//

import SwiftUI

struct UpdateEntry: View {
    @EnvironmentObject var csController: ColourSchemeController
    // EnvironmentObjects are for sharing a State object across multiple classes
    @EnvironmentObject var diaryModelController : DiaryModelController
    // Diary Entry and a copy so it can be reverted if needed
    @State var diaryEntry: DiaryModel
    @State var originalEntry: DiaryModel
    @Environment(\.dismiss) var dismiss
  
    var body: some View {
        NavigationStack{
            
            VStack {
                // header VStack
                VStack{
                    Color(hex: csController.headerColour)
                        .ignoresSafeArea(edges: .top)
                        .frame(height:3)
                    HStack {
                        Text("On:").font(Font.custom("MADEWaffleSlab", fixedSize: 16))
                            .foregroundColor(Color(hex: csController.headerItemColour))
                        DatePicker(
                                "",
                                selection: $diaryEntry.date,
                                 displayedComponents: [.date, .hourAndMinute]
                        ).labelsHidden()
                        Spacer()
                    }.offset(y: 10)
                    .padding(.leading, 6.0)
                    // This is how you pass information to objects
                    TextEditor(text: $diaryEntry.title)
                        .font(Font.custom("MADEWaffleSlab", fixedSize: 20))
                        .foregroundColor(Color(hex: csController.headerItemColour))
                        .frame(height: 40.0)
                        .multilineTextAlignment(.leading)
                        .offset(y:-10)
                        .scrollContentBackground(.hidden)
                        .background(Color(hex: csController.headerColour))
                }.frame(width: UIScreen.main.bounds.width, height: 150)
                    .background(Color(hex: csController.headerColour))
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
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .font(Font.custom("YanoneKaffeesatz-Light", fixedSize: 20))
                }.padding(.horizontal, 4.0)
                .offset(y: -100)
            }.background(Color(hex: csController.backgroundColour))
            .navigationBarItems(trailing:
                // HStack containing the buttons
                HStack{
                    // Save button begin
                    Button(action: {
                        let entries = self.diaryModelController.diaryEntries
                        let index = entries.firstIndex(where: {$0.id == diaryEntry.id})
                        if index != nil{
                            if entries[index!] == diaryEntry {
                                // no need to update if the elements are still the same
                                dismiss()
                            }
                            else{
                                // otherwise update changes made
                                self.diaryModelController.updateDiaryEntry(diaryEntry: diaryEntry, index: index!)
                                dismiss()
                            }
                        }
                    }) {
                        Text("Save").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                    }
                    Button(action: {
                        // Revert text and dates to their original state
                        diaryEntry.title = originalEntry.title
                        diaryEntry.content = originalEntry.content
                        diaryEntry.date = originalEntry.date
                    }) {
                        Text("Revert").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                    }
                })
            
        }.navigationBarBackButtonHidden(true)// Outer VStack
    }
}

struct UpdateEntry_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEntry(diaryEntry: .DummyDiaryEntry, originalEntry: .DummyDiaryEntry)
    }
}
