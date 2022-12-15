//
//  ContentView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-08.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    // @State private var isPresented = false
    // For sending information to the destination view, the state object must be made
    // on the class that will deliver the data
    // @StateObject var currentDateObject = CurrentDateObject()
    @State private var readyToNavigate : Bool = false
    @State private var containsEntries : Bool = true

    var body: some View {
        NavigationStack{
            VStack {
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
                }.frame(width: .infinity, height: 150)
                .offset(y:50)
                .background(Color("headerColour"))
                .cornerRadius(15)
                //  This is used to ignore the safe area on top of screen
                .ignoresSafeArea(edges: .top)
                // header end
                // Entries/No Entries Screen
                VStack {
                    Text("Today")
                        .font(Font.custom("Holla", size: 72))
                    .foregroundColor(Color("entryTextColour"))
                    Text("\(date.formatted(.dateTime.day().month().year()))")
                        .font(Font.custom("Poppins-Light", size: 18))
                        .foregroundColor(Color("headerItemColour"))
                    if(containsEntries){
                        List{
                            EntryRow().listRowSeparator(.hidden)
                            EntryRow().listRowSeparator(.hidden)
                            EntryRow().listRowSeparator(.hidden)
                            EntryRow().listRowSeparator(.hidden)
                            EntryRow().listRowSeparator(.hidden)
                            EntryRow().listRowSeparator(.hidden)
                            EntryRow().listRowSeparator(.hidden)
                        }.frame( maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.horizontal)
                        .listStyle(.plain)
                    }
                    else{
                        NoEntriesView()
                    }
                  
                }.offset(y:-50)
                VStack {
                        Text("Make a new entry today:")
                            .font(Font.custom("Poppins-Light", size: 18))
                            .foregroundColor(Color("headerItemColour"))
                        Button(action: {
                            readyToNavigate.toggle()
                        }) {
                            Image("newEntryIcon")
                        }
                    }.offset(y:-60)
                    .navigationDestination(isPresented: $readyToNavigate) {
                        EntryView()
                    }
                // selection stack end
                Spacer()
            }.background(Color("backgroundColour"))
        }.accentColor(Color("headerItemColour"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NoEntriesView: View{
    var body: some View{
        Image("peng")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300.0, height: 300.0)
        Text("No Entries... Yet.")
            .font(Font.custom("Holla", size: 48))            .fontWeight(.bold)
            .foregroundColor(Color("headerItemColour"))
    }
}


struct EntryRow: View {
    var body: some View {
        HStack(){
            VStack(alignment: .leading) {
                Text("Steps to attain Heaven")
                    .font(Font.custom("YanoneKaffeesatz-Bold", size: 20))
                    .foregroundColor(Color("entryTextColour"))
                    .lineLimit(1)
                    .padding(.horizontal, 4)
                    .padding(.top, 4)
                Text("Spiral staircase, Rhinoceros beetle,Desolation Row,Fig tart,Rhinoceros beetle,Via Dolorosa,Rhinoceros beetle,Singularity point,Giotto,Angel,Hydrangea,Rhinoceros beetle,Singularity point,Secret emperor...")
                    .foregroundColor(Color("entryTextColour"))
                    .font(Font.custom("YanoneKaffeesatz-Light", size: 20))
                    .lineLimit(1)
                    .padding(.top, -4.0)
                    .padding(.bottom, 4.0)
                    .padding(.horizontal, 4)
                Color("backgroundColour")
            }
            .padding(.horizontal, -20.0)
            .padding(.bottom, -20.0)
            
            
        }.listRowBackground(Color("headerColour"))
    }
}
