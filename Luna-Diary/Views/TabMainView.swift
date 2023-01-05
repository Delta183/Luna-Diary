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

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        // This is the tab view on the bottom
        TabView { // <- Use selection here
            ContentView()
                .tabItem {
                    Label("Today", systemImage: "heart")
                }.tag(0)
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
            }.tag(3)
            SettingsView().tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }.tag(4)
        }
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
