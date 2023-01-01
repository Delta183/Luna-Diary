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
    // @State private var showingAlert = false
    
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
            // NavigationBar button placed below
            .navigationBarItems(trailing: Button(action: {
                let entries = self.diaryModelController.getDiaryEntries(date: diaryEntry.date)
                let index = entries.firstIndex(where: {$0.id == diaryEntry.id})
                if index != nil{
                    // Send the entry once it is confirmed to be inside and update
                    // Well aware of the O(n) search each time
                    self.diaryModelController.updateDiaryEntry(diaryEntry: diaryEntry, index: index!)
                    // showingAlert.toggle()
                    dismiss()
                    // Alert doesn't go well with it personally speaking
                }
                else{
                    // otherwise add it if its not in the entries
                    self.diaryModelController.createDiaryEntry(title: diaryEntry.title, content: diaryEntry.content, date: diaryEntry.date)
                    //showingAlert.toggle()
                    dismiss()
                }
                // dismiss()
            }) {
                Text("Save").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                }
                //.alert("Entry Saved", isPresented: $showingAlert) { Button("OK", role: .cancel) { dismiss()} }
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

