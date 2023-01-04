//
//  SearchBar.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI
import Combine

class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
        
    init(delay: DispatchQueue.SchedulerTimeType.Stride) {
        $searchText
            .debounce(for: delay, scheduler: DispatchQueue.main)
            .assign(to: &$debouncedText)
    }
}

struct SearchBar: View {
    @Binding var text: String
    @StateObject var textObserver = TextFieldObserver(delay: 1)

    @State private var isEditing = false
 
    var body: some View {
        HStack {
            TextField("Search ...", text: $textObserver.searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        // Prompts the x button
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                // Prompts the Cancel Button
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
     
                    }) {
                        Text("Cancel")
                    }
                    .font(Font.custom("MADEWaffleSlab", size: 14))
                    .buttonStyle(SearchCancelButton())
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
        }.onReceive(textObserver.$debouncedText) { (val) in
            text = val
        } // End of HStack
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
