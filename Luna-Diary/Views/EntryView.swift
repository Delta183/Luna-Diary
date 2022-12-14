//
//  EntryView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI

struct EntryView: View {
    // Place holder text for the entry
    @State private var profileText = ""
    // boolean for the confrimation dialog
    @State private var confirmationShown = false
    // For the class that will receive the data, needs an enivroment object
    //@EnvironmentObject var currentDateObject: CurrentDateObject
    
    // Needed for dismissing view
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Text("Creating an Entry")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.leading, 6.0)
            // This is how you pass information to objects
            // Also formatting the passed date for only day, month and year
            HStack {
                // currentDateObject.date
                Text("On \(Date().formatted(.dateTime.day().month().year()))")
                    .font(.headline)
                    .foregroundColor(Color("headerItemColour"))
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(.leading, 6.0)
            
            Divider()
                .frame(height: 2.0)
                .background(Color("headerItemColour"))
            VStack {
                Spacer()
                // Look into putting underlines on each line
                TextEditor(text: $profileText)
                    .font(.custom("HelveticaNeue", size: 18))
                    .cornerRadius(20)
                    .lineSpacing(5)
                    .foregroundColor(Color("headerItemColour"))
                    .overlay( // apply a rounded border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("headerItemColour"), lineWidth: 5)
                    )
                    .padding(.all, 17.0)
                Spacer()
            }.background(Color("headerColour"))
            Divider()
                .frame(height: 2.0)
                .background(Color("headerItemColour"))
            HStack {
                Button("Cancel") {
                    confirmationShown.toggle()
                }.confirmationDialog("Are you sure?", isPresented: $confirmationShown) {
                    Button("Cancel Entry", role: .destructive) {
                        withAnimation {
                            dismiss()
                        }
                    }
                    
                    Button("Continue Writing", role: .cancel) {}
                }
                
                .buttonStyle(FallButton())
                Button("Save New Entry") {
                    print("Button pressed 6!")
                }
                
                .buttonStyle(FallButton())
            }.padding(.bottom, 40.0)
                .padding(.top, 12.0) // Hstack end
            
        }
        .background(Color("backgroundColour")) // Vstack end
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        // Add this to previews to be compatible to enviroment objects otherwise
        // the preview will crash
        EntryView()
    }
}
