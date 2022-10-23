//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Алексей on 22.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValueRed: Double = 30
    @State private var sliderValueGreen: Double = 140
    @State private var sliderValueBlue: Double = 60
    @FocusState var isFocused: Bool
    
    var body: some View {
        
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            VStack{
                Palette()
                    .foregroundColor(Color(red:sliderValueRed/255, green: sliderValueGreen/255, blue: sliderValueBlue/255))
                ColorSliderView(value: $sliderValueRed, colorLine: .red)
                    .focused($isFocused)
                ColorSliderView(value: $sliderValueGreen, colorLine: .green)
                    .focused($isFocused)
                ColorSliderView(value: $sliderValueBlue, colorLine: .blue)
                    .focused($isFocused)
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFocused = false
                        //Правильно мыслю?: чтобы заработала передача  значений поля TextField, после нажатия на кнопку и снятия фокуса с поля - надо  сюда перенести метод обработки checkValue(), или вообще все не так надо было?
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
