//
//  CalendarView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI

struct CalendarView: View {
    // Get the current date for the calendar to begin at
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var date = Date()
    // It must remain a state to be subject to change
    @ObservedObject var entriesOfDay = EntriesOfDay()
    // @State var entries: [DiaryModel]
    private let calendar = Calendar.current
    @State private var readyToNavigate : Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Select a Date")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                    .multilineTextAlignment(.center)
                VStack {
                    Divider()
                        .frame(height: 2.0)
                        .background(Color("headerItemColour"))
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    ).datePickerStyle(.graphical)
                    .accentColor(Color("headerItemColour"))
                    .onChange(of: date, perform: { value in
                        entriesOfDay.entries = self.diaryModelController.diaryEntries.filter({calendar.isDate($0.date, inSameDayAs: date)}
                         // This fetch needs to be done on successful edit as well
                    )});
                    Divider()
                        .frame(height: 2.0)
                        .background(Color("headerItemColour"))
                }.background(.white)
                
                HStack {
                    Button("Make an Entry") {
                        readyToNavigate.toggle()

                    }.buttonStyle(FallButton())
                    .navigationDestination(isPresented: $readyToNavigate) {
                        // This will be subject to change 
                        EntryView(diaryEntry: DiaryModel(title: "[New Entry]", content: "Enter Text here...", date: date))
                    }
                    Button("Review Entries") {
                        print("Button pressed 3!")
                    }
                    .buttonStyle(FallButton())
                    
                }.padding(.top, 6.0)
                Text("There are \(entriesOfDay.entries.count) entries for that day")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                VStack {
                    // need to populate it with the initial values
                    if !entriesOfDay.entries.isEmpty {
                        ScrollView {
                            VStack{
                                // bounding id makes each navigation link unique and refreshable on filter.
                                ForEach(entriesOfDay.entries, id: \.id) { diaryEntry in
                                    NavigationLink(destination: ReviewEntry(diaryEntry: diaryEntry)){
                                            EntryRow(diaryEntry: diaryEntry)
                                    }.id(diaryEntry) // important
                                }
                            }
                        }.padding(.top, 50)
                    }
                    else{
                        Spacer()
                    }
                }.offset(y:-50)
                
                // offset the stack by a bit so that the title isn't as high up
            }.background(Color("backgroundColour"))
        }.accentColor(Color("headerItemColour"))
            .onAppear{
                self.entriesOfDay.entries = self.diaryModelController.diaryEntries.filter({calendar.isDateInToday($0.date as Date)})
            }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

// Structures can be used to create classes, a style for a button in this case
struct FallButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("headerItemColour"))
            .foregroundColor(Color("backgroundColour"))
            .clipShape(Capsule())
    }
}
