//
//  SearchView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//

import SwiftUI
// To work on later
struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        VStack{
            Text("Search for Entries")
                .font(.largeTitle)
                .foregroundColor(Color("headerItemColour"))
                .multilineTextAlignment(.center)
            NavigationStack {
                        Text("Searching for \(searchText)")
                            .navigationTitle("Search for Entries")
                    }
                    .searchable(text: $searchText)
                    
        }.background(Color("backgroundColour"))
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
