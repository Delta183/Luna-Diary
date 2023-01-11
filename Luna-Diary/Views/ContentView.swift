//
//  ContentView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-08.
//

import SwiftUI

struct ContentView: View {
    // These environment objects are special ObservedObjects (instances of Observable classes), but environment passes the same instance
    // to multiple subclasses and subviews and there is no need to declare it on all paths towards needed subviews
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    // readyToNavigate is a boolean used for the sake of presenting a new view on a click that toggles it
    @State private var readyToNavigate : Bool = false
    // Declaring a Calendar object to perform comparisons on date
    let calendar = Calendar.current
    
    // SwiftUI requires the returning of views always, hence not being able to code as usual
    var body: some View {
        // Navigation stack creates its own UI of sorts hence it being what wraps all the componnents
        NavigationStack{
            // Fetch the entries of specifically today from the array of all entries
            let entries = self.diaryModelController.diaryEntries.filter({calendar.isDateInToday($0.date as Date)})
            VStack {
                // Header belows
                // Views can be used without importing it
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
                        // Using a ScrollView instead of a List in order to have a more customizable List
                        ScrollView {
                            VStack{
                                // ForEach of course being an elegant for loop
                                ForEach(entries, id: \.self) { diaryEntry in
                                    // Wrap each EntryRow in a Navigation link to the ReviewEntry Page
                                    NavigationLink(destination: ReviewEntry(diaryEntry: diaryEntry)){
                                            EntryRowDate(diaryEntry: diaryEntry)
                                    }
                                }
                            }
                        }.padding(.top, -20)
                    }
                    // Otherwise if there are no entries, display the following view
                    else{
                        NoEntriesView()
                    }

                }.offset(y:-50)


                // Below is the button and text prompt for new entries
                VStack {
                        Text("Make a new entry today:")
                            .font(Font.custom("Poppins-Light", fixedSize: 18))
                            .foregroundColor(Color(hex: csController.entryTextColour))
                        Button(action: {
                            readyToNavigate.toggle()
                        }) {
                            // The rendering mode makes it so that the custom immage color can change
                            Image("newEntryIcon")
                                .renderingMode(.template)
                                .foregroundColor(Color(hex: csController.headerColour))
                        }
                    }.offset(y:-60)
                    // Using this property allows for a custom component to become a navigational link
                    .navigationDestination(isPresented: $readyToNavigate) {
                        // New Entry Button Functionality
                        // Be sure to send the observed controller
                        EntryView(diaryEntry: .DummyDiaryEntry)
                    }
                // selection stack end
                // Spacer is used to populate the rest of the screen with empty space
                Spacer()
                // Given how I used a class to manage 5 colour types and used an extension to the color object to allow hexcode interpretation
                // they are called like this and are able to be made dynamic in this situation
            }.background(Color(hex: csController.backgroundColour))
            // End of NavigationStack on the line below
        }.accentColor(Color(hex: csController.headerItemColour)) // This works as a heirarchy given the stack nature, this will affect subviews
        // However, this is a subview itself thus its colour has been affected
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// Fix the date bug when sent over to the next page



