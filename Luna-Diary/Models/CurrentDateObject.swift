//
//  CurrentDateObject.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-12.
//

import Foundation
// Our observable object class
class CurrentDateObject: ObservableObject {
    @Published var date = Date()
}
