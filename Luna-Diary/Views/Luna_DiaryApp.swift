//
//  Luna_DiaryApp.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-08.
//

import SwiftUI

@main
// Have to get understanding of this
struct Luna_DiaryApp: App {
    var body: some Scene {
        WindowGroup {
            
            // .enviromentObject instantiates the controller for all the classes to use
            TabMainView().environmentObject(DiaryModelController())
        }
    }
}
