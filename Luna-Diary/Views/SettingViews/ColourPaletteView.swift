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
    let colourPalettes = ["Fall Theme", "Winter Theme", "Spring Theme", "Summer Theme"]
    var body: some View {
        NavigationStack{
            VStack{
                Color(hex: csController.backgroundColour)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:5)
                Text("Select a theme:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: csController.headerItemColour))
                    .multilineTextAlignment(.center)
                    .offset(y:20)
                List(colourPalettes, id: \.self, selection: $selection){ theme in
                        Text(theme).listRowBackground(Color(hex: csController.entryRowColour))
                            
                        }.listStyle(.grouped)
                        .scrollContentBackground(Visibility.hidden)
                        .background(Color(hex: csController.backgroundColour))
                        .onChange(of: selection){_ in
                            changeColourScheme()
                        }
                        
                // Currently Selected: Winter Theme
                // Please reset the app for the new theme to take effect
                Text("\(selection ?? "N/A")")
                Spacer()
                   
                }.background(Color(hex: csController.backgroundColour)).accentColor(Color(hex: csController.headerItemColour))
            
        }// body end
    }// NavStack ends
    func changeColourScheme(){
        switch selection{
        case "Winter Theme":
            csController.setNewColours(backgroundColour: "#C0F0F7", entryRowColour: "#76D3F0", entryTextColour: "#137087", headerColour: "#89C7F2", headerItemColour: "#2E266D")
        default:
            csController.setNewColours(backgroundColour: "#FFE7C3", entryRowColour: "#FCCB99", entryTextColour: "#8C4F2D", headerColour: "#F1C596", headerItemColour: "#612808")
        }
        csController.fetchColours()
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}

struct ColourPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        ColourPaletteView()
    }
}
