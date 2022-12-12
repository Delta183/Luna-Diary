//
//  EntryView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI

struct EntryView: View {
    @State private var profileText = ""

    var body: some View {
        VStack {
            Text("Creating an Entry")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("headerItemColour"))
                .multilineTextAlignment(.center)
            Text("On December 21st, 2012")
                .font(.headline)
                .foregroundColor(Color("headerItemColour"))
                .multilineTextAlignment(.center)
            Divider()
                .frame(height: 2.0)
                .background(Color("headerItemColour"))
            VStack {
                Spacer()
                TextEditor(text: $profileText)
                    .font(.custom("HelveticaNeue", size: 18))
                    .cornerRadius(20)
                    .lineSpacing(5)
                    .foregroundColor(Color("headerItemColour"))
                    .navigationTitle("About you")
                    .overlay( /// apply a rounded border
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
                           print("Button pressed 5!")
                }
               
                .buttonStyle(FallButton())
                Button("Save New Entry") {
                           print("Button pressed 6!")
                }
              
                .buttonStyle(FallButton())
            }.padding(.bottom, 40.0)
                .padding(.top, 12.0)
            
        }
        .background(Color("backgroundColour"))
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
    }
}
