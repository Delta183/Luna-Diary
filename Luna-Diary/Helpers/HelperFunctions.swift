//
//  HelperFunctions.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-01.
//

import Foundation
import SwiftUI

// Returns a list of Dates corresponding to the day but of the last n years
func generateLastDays(date: Date, limit: Int) -> [Date]{
    var listOfDates : [Date] = []
    var negatedNumber = 0
    var prevDate = Date()
    // Loop through every year from 1 to the limit, negate the number and subtract it from the date
    for year in 1...limit{
        negatedNumber = year * -1
        prevDate = Calendar.current.date(byAdding: .year, value: negatedNumber, to: date)!
        listOfDates.append(prevDate)
    }
    return listOfDates
}

// Formatter for Date object to return a string in DD/MM/YY format
func getShortStringFromDate(date: Date) -> String{
    let formatter1 = DateFormatter()
    formatter1.dateFormat = "MM/dd/yyyy"
    return (formatter1.string(from: date))
}

func getLongStringFromDate(date: Date) -> String{
    let formatter = DateFormatter()
    // If anything goes wrong, it was the commma after yyyy
    formatter.dateFormat = "EEEE, MMMM d, yyyy, h:mm a"
    return (formatter.string(from: date))
}

// Function exists purely to get the most up-to-date Date information
func getCurrentDate() -> Date{
    return Date()
}

