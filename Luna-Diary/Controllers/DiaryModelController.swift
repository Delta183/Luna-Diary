//
//  DiaryModelController.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-19.
//

import Foundation
import Combine

class DiaryModelController: ObservableObject {
    
    //MARK: - Properties
    @Published var diaryEntries: [DiaryModel] = []
        
    init() {
        loadFromPersistentStore()
    }
    
    
    //MARK: - CRUD Functions
    func createDiaryEntry(title: String?, content: String?, date: Date) {

        let newDiaryEntry = DiaryModel(title: title, content: content, date: date)
        
        diaryEntries.append(newDiaryEntry)
        saveToPersistentStore()
    
    }
    
    // Change this to check for ID rather than other attributes
    func deleteDiaryEntry(diaryEntry: DiaryModel) {
        // Assuming this works, it will delete the particular element from the array
        guard let index = diaryEntries.firstIndex(of: diaryEntry) else { return }
        
        diaryEntries.remove(at: index)
        
        saveToPersistentStore()
    }
    
    
    func updateDiaryEntry(diaryEntry: DiaryModel) {
        if let index = diaryEntries.firstIndex(of: diaryEntry) {
            var updatedDiaryEntry = diaryEntries[index]
            updatedDiaryEntry.title = diaryEntry.title
            updatedDiaryEntry.content = diaryEntry.content
            updatedDiaryEntry.date = diaryEntry.date
            diaryEntries[index] = updatedDiaryEntry
            saveToPersistentStore()
        }
    }
    
    // MARK: Save, Load from Persistent
    private var persistentFileURL: URL? {
      let fileManager = FileManager.default
      guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
       
      return documents.appendingPathComponent("mood.plist")
    }
    
    func saveToPersistentStore() {
        
        // Stars -> Data -> Plist
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(diaryEntries)
            try data.write(to: url)
        } catch {
            print("Error saving diary data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        // Plist -> Data -> Stars
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            diaryEntries = try decoder.decode([DiaryModel].self, from: data)
        } catch {
            print("error loading diary data: \(error)")
        }
    }
}