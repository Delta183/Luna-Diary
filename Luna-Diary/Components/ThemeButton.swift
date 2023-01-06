//
//  FallButton.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-30.
//

import Foundation
import SwiftUI

// Structures can be used to create classes, a style for a button in this case
struct ThemeButton: ButtonStyle {
    @EnvironmentObject var csController: ColourSchemeController
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(15)
            .background(Color(hex: csController.entryTextColour))
            .foregroundColor(Color(hex: csController.backgroundColour))
            .clipShape(Capsule())
    }
}
