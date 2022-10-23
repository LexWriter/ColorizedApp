//
//  SliderView.swift
//  ColorizedApp
//
//  Created by Алексей on 22.10.2022.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var value: Double
    @State var bufferValue = ""
    @State private var showAlert = false
    @FocusState var isFocused: Bool
    
    var colorLine: Color
    
    var body: some View {
        
        HStack {
            Text(lround(value).formatted())
                .font(.title)
                .frame(width: 55)
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(colorLine)
            TextField("\(lround(value))", text: $bufferValue) {
                 checkValue()
            }
            .font(.title)
            .frame(width: 65)
            .focused($isFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .alert("Fail", isPresented: $showAlert, actions: {}) {
                Text("Please from 0 to 255")
            }
        }
        .padding(.horizontal, 20)
    }
    private func checkValue() {
        if let value = Double(bufferValue), (0...255).contains(value) {
            self.value = value
        } else {
            value = 0
            showAlert.toggle()
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(50), colorLine: .red)
    }
}
