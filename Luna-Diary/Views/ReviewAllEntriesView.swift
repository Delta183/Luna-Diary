//
//  ReviewAllEntriesView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-07.
//

import SwiftUI

struct ReviewAllEntriesView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    var body: some View {
        NavigationStack{
            let entries = self.diaryModelController.diaryEntries
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:1)
                Text("All Entries")
                    .font(Font.custom("Holla", fixedSize: 56))
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                    .offset(y:-20)
                // Entries/No Entries Screen
                VStack {
                    // if today's entries are filled
                    if !entries.isEmpty {
                        ScrollView {
                            VStack{
                                // bounding id makes each navigation link unique and refreshable on filter.
                                ForEach(entries, id: \.self) { diaryEntry in
                                    NavigationLink(destination: ReviewEntry(diaryEntry: diaryEntry)){
                                            EntryRowDate(diaryEntry: diaryEntry)
                                    }
                                }
                            }
                        }.padding(.top, -20)
                        
                    }
                    else{
                        NoEntriesView()
                    }
                }
                    Spacer()
                }.background(Color(hex: csController.backgroundColour))
        }.accentColor(Color(hex: csController.entryTextColour))
    }
}

struct ReviewAllEntriesView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAllEntriesView()
    }
}
