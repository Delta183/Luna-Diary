//
//  ColourPaletteView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-04.
//

import SwiftUI


struct ColourPaletteView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var selection: String?
    let colourPalettes = ["Fall Theme", "Winter Theme", "Summer Theme", "Lemon Lime Theme", "Grape Theme",
                          "Chocolate Mint Theme", "Light Theme", "Dark Theme"]
    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:3)
                Text("Select a theme:")
                    .font(Font.custom("Holla", fixedSize: 56))
                    .foregroundColor(Color(hex: csController.entryTextColour))
                    .multilineTextAlignment(.center)
                List(colourPalettes, id: \.self, selection: $selection){ theme in
                    Text(theme).foregroundColor(Color(hex: csController.entryTextColour)).listRowBackground(Color(hex: csController.entryRowColour))
                        }.font(Font.custom("San Francisco" , fixedSize: 16).bold())
                        .listStyle(.grouped)
                        .scrollContentBackground(Visibility.hidden)
                        .background(Color(hex: csController.backgroundColour))
                        .onChange(of: selection){_ in
                            // Update the string that tracks the current theme
                            UserDefaults.standard.set(selection, forKey: "currTheme")
                            // otherwise change the colour variables to the new hex values
                            changeColourScheme()
                        }
                        
                // Currently Selected: Winter Theme
                // Please reset the app for the new theme to take effect
                Text("You have selected: \(selection ?? "N/A")").foregroundColor(Color(hex: csController.entryTextColour)).font(Font.custom("San Francisco" , fixedSize: 16).bold())
                Spacer()
                   
                }.background(Color(hex: csController.backgroundColour))
        }// navStack end

    }// body ends
    func selectedThemeText() -> some View{
        let selectedTheme = UserDefaults.standard.string(forKey: "currTheme") ?? "Fall Theme"
        return Text("Current Theme: \(selectedTheme)")
    }
    
    func changeColourScheme(){
        // Switch in Swift doesn't have fallthrough
        switch selection{
            
        case "Winter Theme":
            csController.setNewColours(backgroundColour: "#C0F0F7", entryRowColour: "#76D3F0", entryTextColour: "#137087", headerColour: "#89C7F2", headerItemColour: "#2E266D")
            
        case "Lemon Lime Theme":
            csController.setNewColours(backgroundColour: "#8DB850", entryRowColour: "#397056", entryTextColour: "#F8E75b", headerColour: "#446E44", headerItemColour: "#FFEB5B")
            
        case "Grape Theme":
            csController.setNewColours(backgroundColour: "#bec4ed", entryRowColour: "#b1a1ed", entryTextColour: "#50459d", headerColour: "#B070CF", headerItemColour: "#4d429a")
            
        case "Chocolate Mint Theme":
            csController.setNewColours(backgroundColour: "#a5e8ce", entryRowColour: "#35d5b3", entryTextColour: "#6d412a", headerColour: "#5fd0c3", headerItemColour: "#6d412a")
        
        case "Summer Theme":
            csController.setNewColours(backgroundColour: "#f9943b", entryRowColour: "#ed5f1e", entryTextColour: "#ffde32", headerColour: "#d56211", headerItemColour: "#ffde32")
            
        case "Light Theme":
            csController.setNewColours(backgroundColour: "#f5f3f5", entryRowColour: "#cfcfcf", entryTextColour: "#1d1d1b", headerColour: "#767878", headerItemColour: "#252524")
            
        case "Dark Theme":
            csController.setNewColours(backgroundColour: "#1c2120", entryRowColour: "#393939", entryTextColour: "#f4f4f4", headerColour: "#a1a2a2", headerItemColour: "#232323")
        // Default being the Fall Theme
        default:
            csController.setNewColours(backgroundColour: "#FFE7C3", entryRowColour: "#FCCB99", entryTextColour: "#8C4F2D", headerColour: "#F1C596", headerItemColour: "#612808")
        }
        csController.fetchColours()
    }
}

struct ColourPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        ColourPaletteView()
    }
}
