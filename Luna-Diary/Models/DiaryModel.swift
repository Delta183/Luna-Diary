//
//  DiaryModel.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-19.
//

import Foundation

// Identifiable guarantees unique IDs
// Hashable allowed me to bind an id to each navigationLink
struct DiaryModel: Identifiable, Equatable, Codable, Hashable{
    var id = UUID()
    var title: String
    var content: String // The content of the diary entry, rather the entry text proper
    var date: Date // creation date
    var modifiedDate: Date? // last date of change, defaults to nil (or creation date if we mark as non-nil)
    
    init(title: String?, content: String?, date: Date) {
        self.title = title!
        self.content = content!
        self.date = date
        self.modifiedDate = nil
    }
}
