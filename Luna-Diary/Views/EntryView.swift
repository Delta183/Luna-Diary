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
    // Needed for dismissing view
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        VStack {
            VStack{
                HStack {
                    Text("On \(Date().formatted(.dateTime.day().month().year()))")
                        .font(Font.custom("Poppins-Light", size: 20))
                        .foregroundColor(Color("headerItemColour"))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.leading, 6.0)
                // This is how you pass information to objects
                // Also formatting the passed date for only day, month and year
                HStack {
                    Text("[New Entry]")
                        .font(Font.custom("Holla", size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color("headerItemColour"))
                        .multilineTextAlignment(.leading)
                    Spacer()
                    // currentDateObject.date
                }.padding(.leading, 6.0)
            }.frame(width: .infinity, height: 150)
                .background(Color("headerColour"))
                .offset(y: 40)
                .cornerRadius(15)
            //  This is used to ignore the safe area on top of screen
                .ignoresSafeArea(edges: .top)
            Divider()
                .frame(height: 2.0)
                .background(Color("headerItemColour"))
            VStack {
                Spacer()
                // Look into putting underlines on each line
                TextEditor(text: $profileText)
                    
                    .padding(.horizontal, 5.0)
                    .font(Font.custom("YanoneKaffeesatz-Light", size: 18))
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
