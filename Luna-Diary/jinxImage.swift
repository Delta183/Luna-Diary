//
//  jinxImage.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-09.
//

import SwiftUI

struct jinxImage: View {
    var body: some View {
        Image("jinx").clipShape(Circle())
            .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }.shadow(radius: 7)

    }
}

struct jinxImage_Previews: PreviewProvider {
    static var previews: some View {
        jinxImage()
    }
}
