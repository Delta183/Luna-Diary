//
//  SearchBar.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-11.
//

import SwiftUI
import Combine

// Subclass purely for purposes of debouncing the text given in the searchbar
class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
        
    // The init function of this class demands a delay time be given, standard is 1 second for now
    init(delay: DispatchQueue.SchedulerTimeType.Stride) {
        $searchText
            .debounce(for: delay, scheduler: DispatchQueue.main)
            .assign(to: &$debouncedText)
    }
}

struct SearchBar: View {
    
    // Binding string for the search
    @Binding var text: String
    // Instantiate the textObserver object with a given delay
    @StateObject var textObserver = TextFieldObserver(delay: 1)
    // Boolean to monitor the state of editing
    @State private var isEditing = false
    @FocusState private var nameIsFocused: Bool

 
    var body: some View {
        HStack {
            TextField("Search ...", text: $textObserver.searchText)
                .focused($nameIsFocused)
                .padding(7)
                .font(Font.custom("San Francisco" , fixedSize: 20))
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                // Overlay for the search bar that allows for the x button to appear
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        // Prompts the x button for clearing text but stat in the typing interface
                        if isEditing {
                            Button(action: {
                                textObserver.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                // On tap of the searchbar, the editing mode begins, thus toggle the boolean
                .onTapGesture {
                    self.isEditing = true
                }
                // Prompts the Cancel Button for clearing text and leaving the typing interface
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        // perhaps this needs to be the debouncedText?
                        textObserver.searchText = ""
                        nameIsFocused = false
                    }) {
                        Text("Cancel")
                    }
                    .font(Font.custom("MADEWaffleSlab", fixedSize: 14))
                    .buttonStyle(SearchCancelButton())
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
        // The text that comes in from the debouncer will go to the actual search for text
        }.onReceive(textObserver.$debouncedText) { (val) in
            // Ensure single or double character searches don't fire
            if val.count > 2{
                text = val
            }
            else{
                text = ""
            }
        } // End of HStack
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
