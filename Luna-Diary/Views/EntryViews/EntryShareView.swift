//
//  EntryShareView.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2023-01-23.
//

import SwiftUI

struct EntryShareView: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State var diaryEntry: DiaryModel
    @Environment(\.dismiss) var dismiss

    // This entire view exists purely to be represented as a PDF
    var body: some View {
        VStack(alignment: .leading){
            Text(diaryEntry.title)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
                .font(.system(size: 28, weight: .heavy, design: .rounded))
                .padding(.leading, 15.0)
            
               
            Text("Written on: \(getLongStringFromDate(date:diaryEntry.date))")
                .font(.system(size: 18))
              .padding(.leading, 15.0)
               
            Text(diaryEntry.content)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
                .font(.system(size: 18))
                .padding()
                
           
        }.background(.white).foregroundColor(.black)
            .frame(
                // Anything about 570 makes the entire text dissapear for some reason
                maxWidth: 570
            )
        // Subject to change but currently something presentable
        
    }
}


struct EntryShareView_Previews: PreviewProvider {
    static var previews: some View {
        EntryShareView(diaryEntry: .DummyDiaryEntry)
    }
}
