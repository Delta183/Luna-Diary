//
//  ContentView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-08.
//

import SwiftUI

struct ContentView: View {
    @StateObject var diaryModelController = DiaryModelController()
    // @State private var isPresented = false
    // For sending information to the destination view, the state object must be made
    // on the class that will deliver the data
    // @StateObject var currentDateObject = CurrentDateObject()
    // This boolean changes the view of the contentView
    @State private var readyToNavigate : Bool = false
    let calendar = Calendar.current
    // SwiftUI requires the returning of views always, hence not being able to code as usual
    var body: some View {
        NavigationStack{
            // Fetch the entries of today
            let entries = self.diaryModelController.diaryEntries.filter({calendar.isDateInToday($0.date as Date)})
            VStack {
                // header begins
                HStack {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 28.0, height: 28.0)
                        .padding(.leading, 12.0)
                        .foregroundColor(Color("headerItemColour"))
                    Text("(username)'s Journal")
                        .font(Font.custom("MADEWaffleSlab", size: 16))
                        .foregroundColor(Color("headerItemColour"))
                    Spacer()
                    Button(action: {
                        print("button pressed")
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .resizable()
                            .frame(width: 28.0, height: 28.0)
                            .padding(.trailing, 12.0)
                            .foregroundColor(Color("headerItemColour"))
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 150)
                .offset(y:40)
                .background(Color("headerColour"))
                .cornerRadius(15)
                //  This is used to ignore the safe area on top of screen
                .ignoresSafeArea(edges: .top)
                // header end
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
                                ForEach(entries, id: \.id) { diaryEntry in
                                    NavigationLink(destination: ReviewEntry(diaryModelController: diaryModelController, diaryEntry: diaryEntry)){
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
                            .foregroundColor(Color("headerItemColour"))
                        Button(action: {
                            readyToNavigate.toggle()
                        }) {
                            Image("newEntryIcon")
                        }
                    }.offset(y:-60)
                    .navigationDestination(isPresented: $readyToNavigate) {
                        // New Entry Button Functionality
                        // Be sure to send the observed controller
                        EntryView(diaryModelController: diaryModelController, diaryEntry: .DummyDiaryEntry)
                    }
                // selection stack end
                Spacer()
            }.background(Color("backgroundColour"))
        // End of NavigationStack on the line below
        }.accentColor(Color("headerItemColour"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// Fix the date bug when sent over to the next page



