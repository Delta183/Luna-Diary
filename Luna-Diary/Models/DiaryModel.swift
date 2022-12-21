//
//  DiaryModel.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-19.
//

import Foundation

// Identifiable guarantees unique IDs
struct DiaryModel: Identifiable, Equatable, Codable {
    var id = UUID()
    var title: String
    var content: String
    var date: Date
    
    init(title: String?, content: String?, date: Date) {
        self.title = title!
        self.content = content!
        self.date = date
    }
}