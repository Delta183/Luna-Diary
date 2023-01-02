//
//  datesList.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-01.
//

import Foundation

struct datesList: Identifiable, Codable{
    var id = UUID()
    var listOfDates = generateLastDays(date: Date(), limit: 10)
}
