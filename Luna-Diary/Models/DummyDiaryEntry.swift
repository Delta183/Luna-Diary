//
//  DummyDiaryEntry.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-27.
//

import Foundation

// This is a dummy diary Entry to avoid having to instantiate new ones for
// every single new entry when they may very well not be used
extension DiaryModel {
    static let DummyDiaryEntry: Self = .init(
        title: "[New Entry]",
        content: "Enter Text here...",
        date: Date()
    )
}
