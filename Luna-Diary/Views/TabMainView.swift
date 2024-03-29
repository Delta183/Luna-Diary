//
//  MainView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI

// A TabView shows the entire class and is the frame for all the views so to speak and that frame gets
// replaced each time hence it is alone and what the Luna_DiaryApp class calls
struct TabMainView: View {
    var csController: ColourSchemeController
    var userNameController: UserNameController
    
    init() {
        self.csController = ColourSchemeController()
        self.userNameController = UserNameController()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        // This is the tab view on the bottom of the screen. Seems they are ran individually but do not reset after their first vist
        TabView {
            ContentView().environmentObject(csController).environmentObject(userNameController)
                .tabItem {
                    Label("Today", systemImage: "heart")
                }.tag(0)
            CalendarView().environmentObject(csController).environmentObject(userNameController)
                .tabItem {
                    Label("Entries", systemImage: "calendar")
                }.tag(1)
            CurrentDayView().environmentObject(csController).environmentObject(userNameController)
            // .badge(1)
                .tabItem {
                    Label("On This Day", systemImage: "clock")
                }.tag(2)
            SearchView().environmentObject(csController).environmentObject(userNameController)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }.tag(3)
            SettingsView().environmentObject(csController).environmentObject(userNameController)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(4)
        }.accentColor(Color(hex: csController.headerItemColour)) // changes colour of icons but also Navigation Stack items
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
