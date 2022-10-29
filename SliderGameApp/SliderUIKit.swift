//
//  Slider.swift
//  SliderGameApp
//
//  Created by Антон Заричный on 28.10.2022.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    @Binding var currentValue: Float
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = currentValue
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

extension SliderUIKit {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(currentValue: .constant(65), alpha: 100)
    }
}
