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
    @EnvironmentObject var csController: ColourSchemeController
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(Color(hex: csController.entryTextColour))
            .foregroundColor(Color(hex: csController.entryRowColour))
            .clipShape(Capsule())
    }
}
