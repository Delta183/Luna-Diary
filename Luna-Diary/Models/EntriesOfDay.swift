//
//  EntriesOfDay.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-29.
//

import Foundation

class EntriesOfDay: ObservableObject{
    @Published var entries: [DiaryModel] = []
   //  private let calendar = Calendar.current
    // diaryModelController.diaryEntries.filter({calendar.isDateInToday($0.date as Date)})
    // init(diaryModelController: DiaryModelController) {
    //    entries = diaryModelController.diaryEntries.filter({calendar.isDateInToday($0.date as Date)})
    //}
    // Make another init for search?
}
