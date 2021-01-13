//
//  LoadingDoubleHelix.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI

struct LoadingDoubleHelix: View {
    @State var isAnimating: Bool = false
    let timing: Double
    
    let maxCounter: Int = 10
    
    let frame: CGSize
    let primaryColor: Color
    
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        timing = speed * 2
        frame = CGSize(width: size, height: size)
        primaryColor = color
    }

    var body: some View {
        ZStack {
            HStack(spacing: frame.width / 40) {
                ForEach(0..<maxCounter) { index in
                    
                    Circle()
                        .fill(primaryColor)
                        .offset(y: isAnimating ? frame.height / 6 : -frame.height / 6)
                        .animation(
                            Animation
                                .easeInOut(duration: timing)
                                .repeatForever(autoreverses: true)
                                .delay(timing / Double(maxCounter) * Double(index))
                        )
                        .scaleEffect(isAnimating ? 1.0 : 0.8)
                        .opacity(isAnimating ? 1.0 : 0.8)
                        .animation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: true))

                }
            }
            
            HStack(spacing: frame.width / 40) {
                ForEach(0..<maxCounter) { index in
                    
                    Circle()
                        .fill(primaryColor)
                        .offset(y: isAnimating ? -frame.height / 6 : frame.height / 6)
                        .animation(
                            Animation
                                .easeInOut(duration: timing)
                                .repeatForever(autoreverses: true)
                                .delay(timing / Double(maxCounter) * Double(index))
                        )
                        .scaleEffect(isAnimating ? 0.8 : 1.0)
                        .opacity(isAnimating ? 0.8 : 1.0)
                        .animation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: true))

                }
            }
            
        }
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .onAppear {
            isAnimating.toggle()
        }
    }
}

struct LoadingDoubleHelix_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .doubleHelix)
    }
}
