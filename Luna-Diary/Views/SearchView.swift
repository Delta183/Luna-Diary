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
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var readyToNavigate : Bool = false
    let calendar = Calendar.current
    
    @State private var searchText = ""

    var body: some View {
        NavigationStack{
            VStack{
                Text("Search for Entries")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                    .multilineTextAlignment(.center)
                    SearchBar(text: $searchText)
                
                    if !searchResults.isEmpty {
                        ScrollView {
                            VStack{
                                // bounding id makes each navigation link unique and refreshable on filter.
                                ForEach(searchResults, id: \.id) { diaryEntry in
                                    NavigationLink(destination: ReviewEntry(diaryEntry: diaryEntry)){
                                        EntryRowDate(diaryEntry: diaryEntry)
                                    }.id(diaryEntry) // important
                                }
                            }
                        }
                        
                    } else{
                        Text("No results found...")
                    }
                    Spacer()
                }.background(Color("backgroundColour"))
            // NavStack ends
            }.accentColor(Color("headerItemColour"))
        }// body end
        var searchResults: [DiaryModel] {
            return diaryModelController.diaryEntries.filter { $0.content.localizedCaseInsensitiveContains(searchText) || $0.title.localizedCaseInsensitiveContains(searchText)}
       }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


