//
//  DeleteEntriesView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-23.
//

import SwiftUI

struct DeleteEntriesView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var confirmationShown = false // used for confirmation dialog
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:3)
                Text("Delete All Entries?")
                    .font(Font.custom("Holla", fixedSize: 56))
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                Button("Confirm Deletion") {
                    confirmationShown.toggle()
                }.buttonStyle(ThemeButton())
                    .font(Font.custom("San Francisco" , fixedSize: 18))
                    .confirmationDialog("Are you sure you want to delete all entries?", isPresented: $confirmationShown) {
                        Button("Delete all Entries", role: .destructive) {
                            // Delete all elements in the array
                            diaryModelController.deleteAllEntries()
                            dismiss()
                        }
                }
                Spacer()
            }.background(Color(hex: csController.backgroundColour))
        }
    }
}

struct DeleteEntriesView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteEntriesView()
    }
}
