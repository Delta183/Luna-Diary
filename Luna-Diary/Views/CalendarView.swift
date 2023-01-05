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
    private let calendar = Calendar.current
    @State private var readyToNavigate : Bool = false

    var body: some View {
        NavigationStack {
            // For all the correct changes to appear, the Published array
            // itself must be DIRECTLY referenced, my issue was that I was simply making a copy previously
            // Call the array directly rather than make a copy
            var entries = self.diaryModelController.diaryEntries.filter({calendar.isDate($0.date, inSameDayAs: date)})
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
                    .frame(width: 320)
                    .accentColor(Color("headerItemColour"))
                    .onChange(of: date, perform: { value in
                        // On change of the date, update the filter and in turn fetch accurate entries from that date
                        entries = self.diaryModelController.diaryEntries.filter({calendar.isDate($0.date, inSameDayAs: date)}
                    )});
                    Divider()
                        .frame(height: 2.0)
                        .background(Color("headerItemColour"))
                }.background(.white) // DatePicker VStack end
                
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
                    
                }.padding(.top, 6.0) // Buttons HStack
                // Below is the entries preview if applicable
                Text("There are \(entries.count) entries for that day")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                VStack {
                    // Present entries if any otherwise put a spacer
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
                        }.padding(.top, 50)
                    }
                    else{
                        Spacer()
                    }
                }.offset(y:-50)
                // offset the stack by a bit so that the title isn't as high up
            }.background(Color("backgroundColour"))
        }.accentColor(Color("headerItemColour"))
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



