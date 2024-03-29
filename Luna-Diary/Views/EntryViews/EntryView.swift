//
//  EntryView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State var diaryEntry: DiaryModel
    @Environment(\.dismiss) var dismiss
  
    var body: some View {
        NavigationStack{
            VStack {
                VStack{
                    Color(hex: csController.headerColour)
                        .ignoresSafeArea(edges: .top)
                        .frame(height:3)
                    HStack {
                        Text("On:").font(Font.custom("MADEWaffleSlab", fixedSize: 16))
                            .foregroundColor(Color(hex: csController.headerItemColour))
                        // Date Pickers are not good displaying in a large font.
                        DatePicker(
                            "",
                            selection: $diaryEntry.date,
                            displayedComponents: [.date, .hourAndMinute] // This ensures only certain information can be input in DatePicker
                        ).labelsHidden() // This hides the given text of DatePicker
                        // .frame(width: 200, height: 100)
                        Spacer()
                    }.offset(y: 10) // HStack
                    .padding(.leading, 6.0)
                    
                    // This is how you pass information to objects
                    // Also formatting the passed date for only day, month and year
                    // Title below
                    TextEditor(text: $diaryEntry.title)
                        .font(Font.custom("MADEWaffleSlab", fixedSize: 20))
                        .foregroundColor(Color(hex: csController.headerItemColour))
                        .frame(height: 40.0)
                        .multilineTextAlignment(.leading)
                        .offset(y:-10)
                        .scrollContentBackground(.hidden) // This has to be done to implement custom backgrounds to some components
                        .background(Color(hex: csController.headerColour))
                        .limitInputLength(value: $diaryEntry.title, length: 500)

                       
                }.frame(width: UIScreen.main.bounds.width, height: 150)
                    .background(Color(hex: csController.headerColour))
                    .offset(y: 40)
                    .cornerRadius(15)
                    .ignoresSafeArea(edges: .top) //  This is used to ignore the safe area on top of screen
                
                // TextEditor VStack begin
                // Content below
                VStack {
                    TextEditor(text: $diaryEntry.content)
                        .padding(.horizontal, 2.0)
                        .scrollContentBackground(.hidden)
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .font(Font.custom("YanoneKaffeesatz-Light", fixedSize: 20))
                        .accentColor(Color(hex: csController.entryTextColour))
                        .limitInputLength(value: $diaryEntry.content, length: 10000)
                }.padding(.horizontal, 4.0)
                    .offset(y: -100)
                
            }.background(Color(hex: csController.backgroundColour))
            // Navigation bar items are responsible for the button on the top bar,in this case the Save button
            .navigationBarItems(trailing:
                // NavigationBar button placed below
                HStack{
                    // Save button begin
                    Button(action: {
                        // Save entry to the array and then dismiss view
                        self.diaryModelController.createDiaryEntry(title: diaryEntry.title, content: diaryEntry.content, date: diaryEntry.date)
                        dismiss()
                    }) {
                        Text("Save").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                    }
                }
            )
        }// Outer VStack
    } // NavigationStack end
}

// This is the additional struct used to limit the number of characters in an entry
struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int

    func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifer(value: value, length: length))
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        // Add this to previews to be compatible to enviroment objects otherwise
        // the preview will crash
        EntryView( diaryEntry: .DummyDiaryEntry)
    }
}

