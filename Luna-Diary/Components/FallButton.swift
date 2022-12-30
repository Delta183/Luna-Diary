//
//  FallButton.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-30.
//

import Foundation
import SwiftUI

// Structures can be used to create classes, a style for a button in this case
struct FallButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("headerItemColour"))
            .foregroundColor(Color("backgroundColour"))
            .clipShape(Capsule())
    }
}
