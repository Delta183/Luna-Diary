//
//  ColourPaletteView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-04.
//

import SwiftUI


struct ColourPaletteView: View {
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State private var selection: String?
    let colourPalettes = ["Fall Theme", "Winter Theme", "Spring Theme", "Summer Theme"]
    var body: some View {
        NavigationStack{
            VStack{
                Text("Select a theme:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("headerItemColour"))
                    .multilineTextAlignment(.center)
                    .offset(y:20)
                List(colourPalettes, id: \.self, selection: $selection){ theme in
                            Text(theme).listRowBackground(Color("entryRowColour"))
                            
                        }.listStyle(.grouped)
                        .scrollContentBackground(Visibility.hidden)
                        .background(Color("backgroundColour"))
                Text("\(selection ?? "N/A")")
                        Spacer()
                   
                }.background(Color("backgroundColour")).accentColor(Color("headerItemColour"))
        }// body end
    }// NavStack ends
}

struct ColourChanger {
    
}

struct ColourPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        ColourPaletteView()
    }
}
