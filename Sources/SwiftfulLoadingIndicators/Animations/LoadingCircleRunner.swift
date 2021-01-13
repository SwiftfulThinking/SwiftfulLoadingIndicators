//
//  LoadingCircleRunner.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI

struct LoadingCircleRunner: View {
    
    @State var isAnimating: Bool = false
    let timing: Double
    
    let frame: CGSize
    let primaryColor: Color
    
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        timing = speed * 4
        frame = CGSize(width: size, height: size)
        primaryColor = color
    }

    var body: some View {
        Circle()
            .trim(from: isAnimating ? 0.9 : 0.8, to: 1.0)
            .stroke(primaryColor,
                    style: StrokeStyle(lineWidth:
                        isAnimating ? frame.height / 10 : frame.height / 20,
                                       lineCap: .round, lineJoin: .round)
            )
            .animation(Animation.easeInOut(duration: timing / 2).repeatForever())
            .rotationEffect(
                Angle(degrees: isAnimating ? 360 : 0)
            )
            .animation(Animation.linear(duration: timing).repeatForever(autoreverses: false))
            .frame(width: frame.width, height: frame.height, alignment: .center)
            .rotationEffect(Angle(degrees: 360 * 0.15))
            .onAppear {
                isAnimating.toggle()
            }
    }
}

struct LoadingCircleRunner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .circleRunner)
    }
}
