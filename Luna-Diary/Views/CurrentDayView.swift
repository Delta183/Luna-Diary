//
//  CurrentDayView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI

struct CurrentDayView: View {
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var readyToNavigate : Bool = false
    var currentDate = Date()
    let calendar = Calendar.current
    let yearLimit = 10
    @State var currentYearCount = 0
    var previousDates = datesList()
    // SwiftUI requires the returning of views always, hence not being able to code as usual
    var body: some View {
        
        NavigationStack{
            // Fetch the entries of today
            
            VStack{
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
                VStack {
                    Text("On this day...")
                        .font(Font.custom("Holla", size: 72))
                    .foregroundColor(Color("entryTextColour"))
                    Text(currentDate, style: .date)
                        .font(Font.custom("Poppins-Light", size: 18))
                        .foregroundColor(Color("headerItemColour"))
                }.offset(y:-70)
               
                VStack {
                    // Here, display the entries from the same day of previous years
                    // if !entries.isEmpty {
                        ScrollView {
                           
                            VStack{
                                // Loop through the dates
                                ForEach(previousDates.listOfDates, id: \.self) { prevDate in
                                    var entries = self.diaryModelController.diaryEntries.filter({calendar.isDate($0.date, inSameDayAs: prevDate)})
                                    // If there are entries, the print out the view
                                    if !entries.isEmpty{
                                        incrementYearView(date2: prevDate)
                                        ForEach(entries, id: \.id) { diaryEntry in
                                            NavigationLink(destination: ReviewEntry(diaryEntry: diaryEntry)){
                                                EntryRow(diaryEntry: diaryEntry)
                                            }.id(diaryEntry) // important
                                        }
                                    }
                                    
                                }
                               
                            }
                            
                        }.padding(.top, -20)
                    // }
                }.offset(y:-50)
                Text("That's all, folks!").font(Font.custom("Holla", size: 36)).foregroundColor(Color("entryTextColour"))
                Spacer()
            }.background(Color("backgroundColour"))
        // End of NavigationStack on the line below
        }.accentColor(Color("headerItemColour"))
    }

    func incrementYearView(date2:Date) -> some View{
        let date1Components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self.currentDate)
        let date2Components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date2)
        let numOfYearDiff = date1Components.year! - date2Components.year!
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

func generateLastDays(date: Date, limit: Int) -> [Date]{
    var listOfDates : [Date] = []
    var negatedNumber = 0
    var prevDate = Date()
    // Loop through every year from 1 to the limit, negate the number and subtract it from the date
    for year in 1...limit{
        negatedNumber = year * -1
        prevDate = Calendar.current.date(byAdding: .year, value: negatedNumber, to: date)!
        listOfDates.append(prevDate)
    }
    return listOfDates
}

