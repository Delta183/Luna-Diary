//
//  EntryRow.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-15.
//

import SwiftUI

struct EntryRow: View {
    var body: some View {
        VStack {
            Color("backgroundColour")
            VStack(alignment: .leading) {
                    Text("Steps to attain Heaven")
                        .font(Font.custom("YanoneKaffeesatz-Bold", size: 20))
                        .foregroundColor(Color("entryTextColour"))
                        .lineLimit(1)
                        .padding([.top, .leading], 4.0)
                        .padding(.bottom, 1.0)
                    Text("Spiral staircase, Rhinoceros beetle,Desolation Row,Fig tart,Rhinoceros beetle,Via Dolorosa,Rhinoceros beetle,Singularity point,Giotto,Angel,Hydrangea,Rhinoceros beetle,Singularity point,Secret emperor...")
                        .foregroundColor(Color("entryTextColour"))
                        .font(Font.custom("YanoneKaffeesatz-Light", size: 20))
                        .lineLimit(1)
                        .padding([.leading, .bottom], 4.0)
                    
                }.background(Color("headerColour"))
            Color("backgroundColour")
        }.frame(height: 60)
        .background(Color("backgroundColour"))
        
    }
}

struct EntryRow_Previews: PreviewProvider {
    static var previews: some View {
        EntryRow()
    }
}
