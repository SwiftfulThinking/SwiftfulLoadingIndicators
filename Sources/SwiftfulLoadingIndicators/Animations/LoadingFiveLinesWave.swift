//
//  LoadingFiveLinesWave.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI

struct LoadingFiveLinesWave: View {    
    @State var isAnimating: Bool = false
    let timing: Double
    
    let maxCounter: Int = 5
    
    let frame: CGSize
    let primaryColor: Color
    
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        timing = speed
        frame = CGSize(width: size, height: size)
        primaryColor = color
    }

    var body: some View {
        HStack(spacing: frame.width / 10) {
            ForEach(0..<maxCounter) { index in
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(primaryColor)
                    .frame(maxHeight: isAnimating ? frame.height / 3 : .infinity)
                    .animation(
                        Animation
                            .easeOut(duration: timing)
                            .repeatForever(autoreverses: true)
                            .delay(timing / Double(maxCounter) * Double(index))
                    )
            }
        }
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .onAppear {
            isAnimating.toggle()
        }
    }
}

struct LoadingFiveLinesWave_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .fiveLinesWave)
    }
}
