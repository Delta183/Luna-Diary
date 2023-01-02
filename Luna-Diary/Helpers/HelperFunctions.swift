//
//  HelperFunctions.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-01.
//

import Foundation

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

func getShortStringFromDate(date: Date) -> String{
    let formatter1 = DateFormatter()
    formatter1.dateStyle = .short
    return (formatter1.string(from: date))
}

