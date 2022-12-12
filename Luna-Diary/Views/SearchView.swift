//
//  SearchView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI

struct Ocean: Identifiable {
    let name: String
    let id = UUID()
}

private var oceans = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]

struct SearchView: View {
    
    @State private var searchText = ""

    var body: some View {
        VStack{
            Text("Search for Entries")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("headerItemColour"))
                .multilineTextAlignment(.center)
            SearchBar(text: $searchText)
            List(oceans) {
                Text($0.name) .listRowBackground(Color("headerColour"))
            }.padding(.top, -15.0).scrollContentBackground(.hidden)
        }.background(Color("backgroundColour"))
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


