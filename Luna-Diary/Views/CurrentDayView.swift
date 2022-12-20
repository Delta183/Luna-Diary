//
//  CurrentDayView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI

struct CurrentDayView: View {
    // Get the current date for the calendar to begin at
    @State private var date = Date()
    // boolean for presenting the entry view
    // @State private var isPresented = false
    // For sending information to the destination view, the state object must be made
    // on the class that will deliver the data
    // @StateObject var currentDateObject = CurrentDateObject()
    @State private var readyToNavigate : Bool = false

    var body: some View {
        NavigationStack{
            VStack {
                Text("On This Day")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                    .multilineTextAlignment(.center)
                Text("\(date.formatted(.dateTime.day().month().year()))")
                    .font(.headline)
                    .foregroundColor(Color("headerItemColour"))
                Text("10 years ago")
                    .font(.headline)
                    .foregroundColor(Color("headerItemColour"))
                Divider()
                    .frame(height: 2.0)
                    .background(Color("headerItemColour"))
                VStack {
                    Spacer()
                    // This will be dynamic similar to the date for entry view
                    Text("My name is Yoshikage Kira. I'm 33 years old. My house is in the northeast section of Morioh, where all the villas are, and I am not married. I work as an employee for the Kame Yu department stores, and I get home every day by 8 PM at the latest. I don't smoke, but I occasionally drink. I'm in bed by 11 PM, and make sure I get eight hours of sleep, no matter what. After having a glass of warm milk and doing about twenty minutes of stretches before going to bed, I usually have no problems sleeping until morning. Just like a baby, I wake up without any fatigue or stress in the morning. I was told there were no issues at my last check-up. I'm trying to explain that I'm a person who wishes to live a very quiet life. I take care not to trouble myself with any enemies, like winning and losing, that would cause me to lose sleep at night. That is how I deal with society, and I know that is what brings me happiness. Although, if I were to fight I wouldn't lose to anyone.")
                        .font(.body)
                        .foregroundColor(Color("headerItemColour"))
                        .multilineTextAlignment(.center)
                    Spacer()
                }.background(Color("headerColour"))
                Divider()
                    .frame(height: 2.0)
                    .background(Color("headerItemColour"))
                HStack {
                    Button("View Entry") {
                        print("Button pressed 5!")
                    }
                    .buttonStyle(FallButton())
                    Button("Make a New Entry") {
                        readyToNavigate.toggle()
                    }.buttonStyle(FallButton())
                    .navigationDestination(isPresented: $readyToNavigate) {
                        EntryView(diaryModelController: DiaryModelController())
                    }
                }.padding(.bottom, 40.0)
                    .padding(.top, 12.0)
            }
            .background(Color("backgroundColour"))
            // This will be needed for the alternate type of button transition
            // .environmentObject(currentDateObject)
        }.accentColor(Color("headerItemColour"))
    }
}

struct CurrentDayView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDayView()
    }
}


