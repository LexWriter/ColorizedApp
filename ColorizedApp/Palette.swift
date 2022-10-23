//
//  Palette.swift
//  ColorizedApp
//
//  Created by Алексей on 22.10.2022.
//

import SwiftUI

struct Palette: View {
    var body: some View {
        Rectangle()
            .frame(width: 360, height: 150)
            .cornerRadius(30)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 6))
            .padding(20)
    }
}

struct Palette_Previews: PreviewProvider {
    static var previews: some View {
        Palette()
    }
}
