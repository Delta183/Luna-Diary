//
//  datesList.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-01.
//

import Foundation

// This was mainly made so that it could be done in a ForEach loop and maintain Published status
struct datesList: Identifiable, Codable{
    var id = UUID()
    var listOfDates = generateLastDays(date: Date(), limit: 10)
}
