//
//  CurrentDayView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI

struct CurrentDayView: View {
    var body: some View {
        VStack {
            Text("On This Day")
                .font(.largeTitle)
                .foregroundColor(Color("headerItemColour"))
                .multilineTextAlignment(.center)
            Text("December 21st 2012")
                .font(.headline)
                .foregroundColor(Color("headerItemColour"))
            Divider()
                .frame(height: 2.0)
                .background(Color("headerItemColour"))
            VStack {
            Spacer()
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
                .padding(.bottom, 24.0)
                .padding(.top, 12.0)
                .buttonStyle(FallButton())
                Button("Make a New Entry") {
                           print("Button pressed 6!")
                }
                .padding(.bottom, 24.0)
                .padding(.top, 12.0)
                .buttonStyle(FallButton())
            }
            Spacer()
        }.offset(y:25)
        .background(Color("backgroundColour"))
    }
}

struct CurrentDayView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDayView()
    }
}

