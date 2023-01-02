//
//  SearchCancelButton.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-02.
//

import Foundation
import SwiftUI

// Structures can be used to create classes, a style for a button in this case
struct SearchCancelButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(Color("entryTextColour"))
            .foregroundColor(Color("entryRowColour"))
            .clipShape(Capsule())
    }
}
