//
//  UserNameController.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-07.
//

import Foundation

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
    
    func changeName(name: String){
        UserDefaults.standard.set(name, forKey: "userName")
        self.userName = name
    }
}
