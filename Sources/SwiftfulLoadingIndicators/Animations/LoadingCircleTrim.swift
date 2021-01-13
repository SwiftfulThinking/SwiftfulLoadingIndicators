//
//  LoadingCircleTrim.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI

struct LoadingCircleTrim: View {
    
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
            .trim(from: 0.5, to: 1.0)
            .stroke(primaryColor,
                    style: StrokeStyle(lineWidth: frame.height / 20, lineCap: .round, lineJoin: .round)
            )
            .rotationEffect(
                Angle(degrees: isAnimating ? 360 : 0)
            )
            .overlay(
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .stroke(primaryColor,
                            style: StrokeStyle(lineWidth: frame.height / 20, lineCap: .round, lineJoin: .round)
                    )
                    .frame(width: frame.width / 2, height: frame.height / 2, alignment: .center)
                    .rotationEffect(
                        Angle(degrees: isAnimating ? -360 : 0)
                    )
            )
            .frame(width: frame.width, height: frame.height, alignment: .center)
            .onAppear {
                withAnimation(Animation.linear(duration: timing).repeatForever(autoreverses: false)) {
                    isAnimating.toggle()
            }
        }
    }
}

struct LoadingCircleTrim_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .circleTrim)
    }
}
