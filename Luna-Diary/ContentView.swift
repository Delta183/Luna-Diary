//
//  ContentView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-08.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()

    var body: some View {
            VStack {
                HStack {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 28.0, height: 28.0)
                        .padding(.leading, 12.0)
                        .foregroundColor(Color("headerItemColour"))
                        .offset(y:30)
                    Text("Daniel Figueroa")
                        .font(.title)
                        .offset(y:30)
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
                            .offset(y:30)
                    }
                    
                }.frame(width: .infinity, height: 125)
                    .background(Color("headerColour"))
                    .cornerRadius(15)
                //  This is used to ignore the safe area on top of screen
                    .ignoresSafeArea(edges: .top)
                // header end
                
                Image("peng")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300.0, height: 300.0)
                Text("No Entries... Yet.")
                    .font(.largeTitle)
                    .foregroundColor(Color("headerItemColour"))
                Text("Write a memory made on:")
                    .font(.headline)
                    .foregroundColor(Color("headerItemColour"))
                HStack {
                    // labelsHidden as each DatePicker comes with implicit Text
                    DatePicker("", selection: $date, displayedComponents: .date)
                        .padding(.leading, 12.0)
                        .labelsHidden()
                        .frame(width: 130.0, height: 50.0)
                    Button(action: {
                        print("button pressed 2")
                    }) {
                        Image(systemName: "checkmark.rectangle.fill")
                            .foregroundColor(Color("headerItemColour"))
                            .padding(.trailing, 5.0)
                            .frame(width: 50.0, height: 50.0)
                            .background(.white)
                    }
                }
                .frame(width: 180, height: 50)
                .background(Color("selectionColour"))
                .cornerRadius(15)
                // selection stack end
                Spacer()
                
                
            }.background(Color("backgroundColour"))
        
            
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

