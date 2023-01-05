//
//  ReviewEntry.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-15.
//

import SwiftUI

struct ReviewEntry: View {
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State var diaryEntry: DiaryModel
    @State private var readyToNavigate : Bool = false
    // boolean for the confrimation dialog
    @State private var confirmationShown = false // Unused
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
                        Text(diaryEntry.date, style: .date)
                            .font(Font.custom("MADEWaffleSlab", size: 16))
                            .foregroundColor(Color("entryTextColour"))
                            .multilineTextAlignment(.leading)
                        Text(diaryEntry.date, style: .time)
                            .font(Font.custom("MADEWaffleSlab", size: 16))
                            .foregroundColor(Color("entryTextColour"))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(.leading, 6.0)
                    // This is how you pass information to objects
                    // Also formatting the passed date for only day, month and year
                    HStack {
                        Text(diaryEntry.title)
                            .font(Font.custom("MADEWaffleSlab", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("headerItemColour"))
                            .multilineTextAlignment(.leading)
                        Spacer()
                        // currentDateObject.date
                    }.padding(.leading, 6.0)
                }.frame(width: UIScreen.main.bounds.width, height: 150)
                    .background(Color("headerColour"))
                    .offset(y: 40)
                    .cornerRadius(15)
                //  This is used to ignore the safe area on top of screen
                    .ignoresSafeArea(edges: .top)
                // TextEditor VStack begin
                VStack {
                    // Look into putting underlines on each line
                    Text(diaryEntry.content)
                        .foregroundColor(Color("entryTextColour"))
                        .font(Font.custom("YanoneKaffeesatz-Light", size: 20))
                        .lineSpacing(2)
                }.padding(.horizontal, 2)
                .offset( y:-90)
                Spacer()
            }.background(Color("backgroundColour"))
            // NavigationBar button placed below
            .navigationBarItems(trailing:
                HStack {
                    // Edit Button
                    Button(action: {
                            // Action for the navbar button here
                            // print("Edit button pressed...")
                        readyToNavigate.toggle()
                        }) {
                            Text("Edit").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                        }.navigationDestination(isPresented: $readyToNavigate){
                            UpdateEntry(diaryEntry: diaryEntry, originalEntry: diaryEntry)
                        }
                    // edit button end
                    // delete button begin
                    Button(action: {                       
                        confirmationShown.toggle()
                        // dismiss()
                        }) {
                            Text("Delete").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", size: 24))
                    }.confirmationDialog("Are you sure?",
                                          isPresented: $confirmationShown) {
                                          Button("Confirm Delete", role: .destructive) {
                                              diaryModelController.deleteDiaryEntry(diaryEntry: diaryEntry)
                                              dismiss()
                                           }
                                         }// delete button end
                }// Hstack end for nav buttons
               )
        }// Outer VStack
    } // NavigationStack end
}

struct ReviewEntry_Previews: PreviewProvider {
    static var previews: some View {
        ReviewEntry(diaryEntry: DiaryModel(title: "Steps to achieve Heaven", content: "Spiral staircase, Rhinoceros beetle, Spiral staircase, Rhinoceros beetle, Desolation RowSpiral staircase, Rhinoceros beetle, Desolation RowSpiral staircase, Rhinoceros beetle, Desolation RowSpiral staircase, Rhinoceros beetle, Desolation Row", date: Date()))
    }
}
