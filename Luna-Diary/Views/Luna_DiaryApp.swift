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
            
            // .enviromentObject instantiates the controller for all the subclasses to use and the same applies to their subclasses
            TabMainView().environmentObject(DiaryModelController())
        }
    }
}
