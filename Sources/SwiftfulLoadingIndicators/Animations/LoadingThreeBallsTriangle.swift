//
//  LoadingThreeBallsTriangle.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI
import Combine

struct LoadingThreeBallsTriangle: View {
    
    @State var isAnimating: Bool = false
    let timing: Double
    
    let maxCounter = 3
    
    let frame: CGSize
    let primaryColor: Color

    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        timing = speed * 2
        frame = CGSize(width: size, height: size)
        primaryColor = color
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: 0,
                    y: isAnimating ? -frame.height / 3 : 0)

            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: isAnimating ? -frame.height / 3 : 0,
                    y: isAnimating ? frame.height / 3 : 0)

            Circle()
                .fill(primaryColor)
                .frame(height: frame.height / 3)
                .offset(
                    x: isAnimating ? frame.height / 3 : 0,
                    y: isAnimating ? frame.height / 3 : 0)
        }
        .animation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: true))
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
        .animation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: false))
        .onAppear {
            isAnimating = true
        }
    }
}

struct LoadingThreeBallsTriangle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .threeBallsTriangle)
    }
}
