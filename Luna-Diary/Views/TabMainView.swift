//
//  MainView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI

// A TabView shows the entire class and is the frame
// for all the views so to speak and that frame gets
// replaced each time hence it is alone
struct TabMainView: View {
    // Have to do this so the calendar starts with
    @EnvironmentObject var diaryModelController : DiaryModelController
    let calendar = Calendar.current
    @State var selection = 0 // <- Here declare selection


    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        // This is the tab view on the bottom
        TabView(selection: $selection) { // <- Use selection here
            ContentView()
                .tabItem {
                    Label("Today", systemImage: "heart")
                }.tag(0)
            // entries: diaryModelController.diaryEntries.filter({calendar.isDateInToday($0.date as Date)})
            CalendarView()
                .tabItem {
                    Label("Entries", systemImage: "calendar")
                }.tag(1)
            CurrentDayView()
                .badge(1)
                .tabItem {
                    Label("On This Day", systemImage: "clock")
                }.tag(2)
            SearchView().tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }.tag(4)
            SettingsView().tabItem {
                                Image(systemName: "gear")
                                Text("Settings")
            }.tag(5)
        }
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
