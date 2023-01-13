//
//  CalendarView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var csController: ColourSchemeController
    // Get the current date for the calendar to begin at
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var date = Date()
    private let calendar = Calendar.current
    @State private var navigateEntry : Bool = false
    @State private var navigateReview : Bool = false


    var body: some View {
        NavigationStack {
            // For all the correct changes to appear, the Published array
            // itself must be DIRECTLY referenced, my issue was that I was simply making a copy previously
            // Call the array directly rather than make a copy
            var entries = self.diaryModelController.diaryEntries.filter({calendar.isDate($0.date, inSameDayAs: date)})
            VStack {
                // In general, this is used to create the illusion of a full screen colour, some issue was presented with the new colour schemes
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:5)
                Text("Select a Date")
                    .font(Font.custom("Holla", fixedSize: 72))
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                    .frame(height: 73)
                // Calendar section below
                VStack {
                    Divider()
                        .frame(height: 2.0)
                        .background(Color(hex: csController.entryTextColour))
                    DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                    ).datePickerStyle(.graphical)
                    .frame(width: 320)
                    .accentColor(Color(hex: csController.headerItemColour))
                    
                    .onChange(of: date, perform: { value in
                        // On change of the date, update the filter and in turn fetch accurate entries from that date
                        entries = self.diaryModelController.diaryEntries.filter({calendar.isDate($0.date, inSameDayAs: date)}
                    )});
                    Divider()
                        .frame(height: 2.0)
                        .background(Color(hex: csController.headerItemColour))
                }.background(Color(hex: csController.headerColour))
                
                // Button row below
                HStack {
                    Button("Make an Entry") {
                        navigateEntry.toggle()
                    }.buttonStyle(ThemeButton())
                    .font(.system(size: 16))
                    .navigationDestination(isPresented: $navigateEntry) {
                        // This will be subject to change 
                        EntryView(diaryEntry: DiaryModel(title: "[New Entry]", content: "Enter Text here...", date: date))
                    }
                    Button("Review All Entries") {
                        navigateReview.toggle()
                    }.buttonStyle(ThemeButton())
                        .font(.system(size: 16))
                    .navigationDestination(isPresented: $navigateReview) {
                        ReviewAllEntriesView()
                    }
                }.padding(.top, 6.0) // Buttons HStack
                // Below is the entries preview if applicable
                if entries.count == 1{
                    Text("There is 1 entry for that day")
                        .font(.system(size: 15).bold())
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .frame(height: 16)
                }
                else{
                    Text("There are \(entries.count) entries for that day")
                        .font(.system(size: 15).bold())
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .frame(height: 16)
                }
                
                VStack {
                    // Present entries if any otherwise put a spacer
                    if !entries.isEmpty {
                        ScrollView {
                            VStack{
                                // bounding id makes each navigation link unique and refreshable on filter.
                                ForEach(entries, id: \.self) { diaryEntry in
                                    NavigationLink(destination: ReviewEntry(diaryEntry: diaryEntry)){
                                        EntryRowDate(diaryEntry: diaryEntry)
                                    }
                                }
                            }
                        }.padding(.top, 50)
                    }
                    else{
                        Spacer()
                    }
                }.offset(y:-50)
                // offset the stack by a bit so that the title isn't as high up
            }.background(Color(hex: csController.backgroundColour))
        }.accentColor(Color(hex: csController.entryTextColour)) // Nav stack end
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



