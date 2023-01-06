//
//  ContentView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var readyToNavigate : Bool = false
    let calendar = Calendar.current
    // SwiftUI requires the returning of views always, hence not being able to code as usual
    var body: some View {
        NavigationStack{
            // Fetch the entries of today
            let entries = self.diaryModelController.diaryEntries.filter({calendar.isDateInToday($0.date as Date)})
            VStack {
                // header begins
                HeaderView()
                // Today Header below
                if(!entries.isEmpty){
                    TodayHeader().offset(y:-60)
                }
                else{
                    TodayHeader().offset(y:-30)
                }
                
                // Entries/No Entries Screen
                VStack {
                    // if today's entries are filled
                    if !entries.isEmpty {
                        ScrollView {
                            VStack{
                                // bounding id makes each navigation link unique and refreshable on filter.
                                ForEach(entries, id: \.self) { diaryEntry in
                                    NavigationLink(destination: ReviewEntry(diaryEntry: diaryEntry)){
                                            EntryRow(diaryEntry: diaryEntry)
                                    }.id(diaryEntry) // important
                                }
                            }
                        }.padding(.top, -20)
                        
                    }
                    else{
                        NoEntriesView()
                    }
                  
                }.offset(y:-50)
            
                // Below is the button and text prompt for new entries
                VStack {
                        Text("Make a new entry today:")
                            .font(Font.custom("Poppins-Light", size: 18))
                            .foregroundColor(Color(hex: csController.headerItemColour))
                        Button(action: {
                            readyToNavigate.toggle()
                        }) {
                            Image("newEntryIcon")
                        }
                    }.offset(y:-60)
                    .navigationDestination(isPresented: $readyToNavigate) {
                        // New Entry Button Functionality
                        // Be sure to send the observed controller
                        EntryView(diaryEntry: .DummyDiaryEntry)
                    }
                // selection stack end
                Spacer()
            }.background(Color(hex: csController.backgroundColour))
            // "#FFE7C3" backgroundColour
        // End of NavigationStack on the line below
        }.accentColor(Color(hex: csController.headerItemColour))
        // "#612808" headerItemColour
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Fix the date bug when sent over to the next page



