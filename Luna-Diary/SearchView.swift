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

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
