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

    var body: some View {
        VStack {
            Text("Pick a date to review entries from that day")
                .font(.title)
                .foregroundColor(Color("headerItemColour"))
                .multilineTextAlignment(.center)
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
            Button("Review Entries") {
                       print("Button pressed 3!")
                   }
                   .buttonStyle(FallButton())
                   .padding(.vertical, 12.0)
            Spacer()
            // offset the stack by a bit so that the title isn't as high up
        }.offset(y:100)
        .background(Color("backgroundColour"))
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
