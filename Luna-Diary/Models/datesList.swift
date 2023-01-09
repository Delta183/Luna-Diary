//
//  datesList.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-01.
//

import Foundation

// This was mainly made so that it could be done in a ForEach loop and maintain Published status
struct datesList: Identifiable, Codable{
    // Identifiable demands a unique ID be made for each and it is Identifiable mainly for the purposes of ForEach
    var id = UUID()
    // An array of Date Objects and for now the limit is hardcoded to the last 10 years 
    var listOfDates = generateLastDays(date: Date(), limit: 10)
}
