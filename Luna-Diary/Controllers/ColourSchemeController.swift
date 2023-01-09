//
//  ColourSchemeController.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-05.
//

import Foundation
import Combine
import SwiftUI

class ColourSchemeController: ObservableObject{
    // Published variables representing 5 different colours consistently used throughout the entire app's interface
    @Published var backgroundColour : String
    @Published var entryRowColour: String
    @Published var entryTextColour: String
    @Published var headerColour: String
    @Published var headerItemColour: String
    
    init() {
        // If this is nil, that means it is the first launch
        if UserDefaults.standard.object(forKey: "backgroundColour") == nil{
            self.backgroundColour = "#FFE7C3"
            self.entryRowColour = "#FCCB99"
            self.entryTextColour = "#8C4F2D"
            self.headerColour = "#F1C596"
            self.headerItemColour = "#612808"
        // Otherwise call the value from UserDefaults and we're doing this because calling from assets is not pracitical as assets are immutable
        } else {
            self.backgroundColour = UserDefaults.standard.string(forKey: "backgroundColour")!
            self.entryRowColour = UserDefaults.standard.string(forKey: "entryRowColour")!
            self.entryTextColour = UserDefaults.standard.string(forKey: "entryTextColour")!
            self.headerColour = UserDefaults.standard.string(forKey: "headerColour")!
            self.headerItemColour = UserDefaults.standard.string(forKey: "headerItemColour")!
        }
       
    }
    
    // Setting new colours take in the hex values and assigns them to the UserDefaults spots for the colours
    func setNewColours(backgroundColour: String, entryRowColour: String, entryTextColour: String, headerColour: String, headerItemColour: String){
        UserDefaults.standard.set(backgroundColour, forKey: "backgroundColour")
        UserDefaults.standard.set(entryRowColour, forKey: "entryRowColour")
        UserDefaults.standard.set(entryTextColour, forKey: "entryTextColour")
        UserDefaults.standard.set(headerColour, forKey: "headerColour")
        UserDefaults.standard.set(headerItemColour, forKey: "headerItemColour")
    }
    
    // This function is called on completion of a colour change to ensure a change of the published variables
    func fetchColours(){
        self.backgroundColour = UserDefaults.standard.string(forKey: "backgroundColour")!
        self.entryRowColour = UserDefaults.standard.string(forKey: "entryRowColour")!
        self.entryTextColour = UserDefaults.standard.string(forKey: "entryTextColour")!
        self.headerColour = UserDefaults.standard.string(forKey: "headerColour")!
        self.headerItemColour = UserDefaults.standard.string(forKey: "headerItemColour")!
    }
    
}
