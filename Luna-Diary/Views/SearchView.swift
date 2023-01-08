//
//  SearchView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-10.
//
import SwiftUI

struct SearchView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var readyToNavigate : Bool = false
    let calendar = Calendar.current
    
    @State private var searchText = ""

    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:5)
                Text("Search for Entries")
                    .font(Font.custom("Holla", fixedSize: 56))
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                SearchBar(text: $searchText)
                // Display results of search be it successful results or nothing should no results return
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
                } else {
                    Text("No results found...").font(Font.custom("San Francisco" , fixedSize: 20).bold())
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: csController.entryTextColour))
                        .multilineTextAlignment(.center)
                }
                // Spacer for if there is no entries
                Spacer()
            }.background(Color(hex: csController.backgroundColour)) // VStack ends
        }.accentColor(Color(hex: csController.headerItemColour)) // NavStack ends
    }// body end
    // The information populating the searchResults array will be entries that have a title or content containing the given word
    var searchResults: [DiaryModel] {
        return diaryModelController.diaryEntries.filter { $0.content.localizedCaseInsensitiveContains(searchText) || $0.title.localizedCaseInsensitiveContains(searchText)}
   }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


