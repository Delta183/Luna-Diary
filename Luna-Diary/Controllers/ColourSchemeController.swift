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
    var backgroundColour : String
    var entryRowColour: String
    var entryTextColour: String
    var headerColour: String
    var headerItemColour: String
    
    init() {
        // If this is nil, that means it is the first launch
        if UserDefaults.standard.object(forKey: "backgroundColour") == nil{
            self.backgroundColour = "#FFE7C3"
            self.entryRowColour = "#FCCB99"
            self.entryTextColour = "#8C4F2D"
            self.headerColour = "#F1C596"
            self.headerItemColour = "#612808"
        // Otherwise call the value from UserDefaults
        } else {
            self.backgroundColour = UserDefaults.standard.string(forKey: "backgroundColour")!
            self.entryRowColour = UserDefaults.standard.string(forKey: "entryRowColour")!
            self.entryTextColour = UserDefaults.standard.string(forKey: "entryTextColour")!
            self.headerColour = UserDefaults.standard.string(forKey: "headerColour")!
            self.headerItemColour = UserDefaults.standard.string(forKey: "headerItemColour")!
        }
       
    }
    
    // Setting new colours take in the hex values
    func setNewColours(backgroundColour: String, entryRowColour: String, entryTextColour: String, headerColour: String, headerItemColour: String){
        UserDefaults.standard.set(backgroundColour, forKey: "backgroundColour")
        UserDefaults.standard.set(entryRowColour, forKey: "entryRowColour")
        UserDefaults.standard.set(entryTextColour, forKey: "entryTextColour")
        UserDefaults.standard.set(headerColour, forKey: "headerColour")
        UserDefaults.standard.set(headerItemColour, forKey: "headerItemColour")
    }
    
    func fetchColours(){
        self.backgroundColour = UserDefaults.standard.string(forKey: "backgroundColour")!
        self.entryRowColour = UserDefaults.standard.string(forKey: "entryRowColour")!
        self.entryTextColour = UserDefaults.standard.string(forKey: "entryTextColour")!
        self.headerColour = UserDefaults.standard.string(forKey: "headerColour")!
        self.headerItemColour = UserDefaults.standard.string(forKey: "headerItemColour")!
    }
    
}
