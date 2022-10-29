//
//  ContentView.swift
//  SliderGameApp
//
//  Created by Антон Заричный on 28.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    
    @State private var alertPresented = false

    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue) ")
                .padding(.bottom, 10)

            HStack {
                Text("0")
                SliderUIKit(alpha: computeScore(), currentValue: $currentValue)
                Text("100")
            }
            .padding(.bottom, 20)

            Button("Проверь меня!") {
                alertPresented.toggle()
            }
            .alert("Your Score", isPresented: $alertPresented, actions: {
                Button("Ok", action: {})
            }, message: {
                Text("\(computeScore())")
            })
            .padding(.bottom, 20)

            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = Float.random(in: 0...100)
            }
        }
        .padding()
    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
