//
//  CurrentDateObject.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-12.
//

import Foundation
// Our observable object class and effectively our modeal
class CurrentDateObject: ObservableObject {
    // Recall the principals of classes, in which the date is an attribute of the class
    @Published var date = Date()
}
