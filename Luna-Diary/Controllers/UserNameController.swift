//
//  UserNameController.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-07.
//

import Foundation

// This class is responsible simply for controlling the userName on the Headers
class UserNameController: ObservableObject{
    @Published var userName: String
    
    init() {
        // On subsequent runs, the name should be pulled from UserDefaults
        if UserDefaults.standard.string(forKey: "userName") == nil{
            self.userName = ""
        }
        else{
            self.userName = UserDefaults.standard.string(forKey: "userName")!
        }
    }
    
    // This function resets the given name and then changing the Published variable
    func changeName(name: String){
        UserDefaults.standard.set(name, forKey: "userName")
        self.userName = name
    }
}
