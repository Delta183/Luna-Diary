//
//  CalendarView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI



struct CalendarView: View {
    // Get the current date for the calendar to begin at
    @State private var date = Date()
    @State private var isPresented = false
    // For sending information to the destination view, the state object must be made
    // on the class that will deliver the data
    @StateObject var currentDateObject = CurrentDateObject()


    var body: some View {
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
                Divider()
                    .frame(height: 2.0)
                    .background(Color("headerItemColour"))
            }.background(.white)
            
            HStack {
                Button("Make an Entry") {
                            isPresented.toggle()
                            // Set the state object to the updated date of this class
                            currentDateObject.date = date
                       }
                       .buttonStyle(FallButton())
                       .fullScreenCover(isPresented: self.$isPresented){
                           EntryView()
                       }
                Button("Review Entries") {
                           print("Button pressed 3!")
                       }
                       .buttonStyle(FallButton())
                   
            }.padding(.top, 6.0)
            Text("There are N entries for that day")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color("headerItemColour"))
            List {
                Text("I was looking for a job")
                Text("Then I found a job")
                Text("And heaven knows I'm miserable now...")
            }.scrollContentBackground(.hidden)
                .padding(.top, -40)
            Spacer()
            // offset the stack by a bit so that the title isn't as high up
        }
        .background(Color("backgroundColour"))
        .environmentObject(currentDateObject)
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
