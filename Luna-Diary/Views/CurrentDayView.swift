//
//  CurrentDayView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI

struct CurrentDayView: View {
    @EnvironmentObject var diaryModelController : DiaryModelController
    // Boolean used for navigation to other pages on click of custom buttons lol
    @State private var readyToNavigate : Bool = false
    var currentDate = Date()
    // instantiation of Calendar object such that comparisons of date can be made
    let calendar = Calendar.current
    // let yearLimit = 10
    @State var currentYearCount = 0
    // Identifiable and Codable Struct containing an array of Date Objects
    var previousDates = datesList()
    // SwiftUI requires the returning of views always, hence not being able to code as usual
    var body: some View {
        
        NavigationStack{
            VStack{
                HeaderView()
                // On this day and Date
                VStack {
                    Text("On this day...")
                        .font(Font.custom("Holla", size: 72))
                    .foregroundColor(Color("entryTextColour"))
                    Text(currentDate, style: .date)
                        .font(Font.custom("Poppins-Light", size: 18))
                        .foregroundColor(Color("headerItemColour"))
                }.offset(y:-70)
                // Below is the ScrollView displaying all entires if applicable
                VStack {
                    // Here, display the entries from the same day of previous years
                    ScrollView {
                        VStack{
                            // Loop through the dates
                            ForEach(previousDates.listOfDates, id: \.self) { prevDate in
                                let entries = self.diaryModelController.diaryEntries.filter({calendar.isDate($0.date, inSameDayAs: prevDate)})
                                // If there are entries, the print out the view
                                if !entries.isEmpty{
                                    getYearDifference(date2: prevDate)
                                    ForEach(entries, id: \.self) { diaryEntry in
                                        NavigationLink(destination: ReviewEntry(diaryEntry: diaryEntry)){
                                            EntryRowDate(diaryEntry: diaryEntry)
                                        }.id(diaryEntry) // important
                                    } // Nested ForEach
                                } // if end
                            } // Outer ForEach
                        }
                    }.padding(.top, -20) // ScrollView End
                }.offset(y:-50) // VStack end for ScrollView
                Text("That's all, folks!").font(Font.custom("Holla", size: 36)).foregroundColor(Color("entryTextColour"))
                Spacer()
            }.background(Color("backgroundColour"))
        }.accentColor(Color("headerItemColour"))// End of NavigationStack
    }

    // This function is to subvert the issues with changes in Views when it came to incrementing a variable
    func getYearDifference(date2:Date) -> some View{
        // Fetch the components of both date objects such that mathematical operations can be completed
        let currDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self.currentDate)
        let date2Components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date2)
        let numOfYearDiff = currDateComponents.year! - date2Components.year!
        if numOfYearDiff <= 1 {
            return Text("\(numOfYearDiff) year ago").foregroundColor(Color("headerItemColour"))
        }
        else{
            return Text("\(numOfYearDiff) years ago").foregroundColor(Color("headerItemColour"))
        }
    }
}

struct CurrentDayView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDayView().environmentObject(DiaryModelController())
    }
}

