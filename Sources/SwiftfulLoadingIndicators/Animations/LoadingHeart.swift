//
//  LoadingHeart.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/13/21.
//

import SwiftUI

struct LoadingHeart: View {
    
    @State var isAnimating: Bool = false
    let timing: Double
    
    let frame: CGSize
    let primaryColor: Color
    
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        timing = speed * 2
        frame = CGSize(width: size, height: size)
        primaryColor = color
    }

    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: frame.height * 0.9))
            .foregroundColor(primaryColor)
            .scaleEffect(isAnimating ? 1.0 : 0.3)
            .animation(Animation.easeInOut(duration: timing).repeatForever(autoreverses: true))
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.easeInOut(duration: timing * 2).repeatForever(autoreverses: false))
            .frame(width: frame.width, height: frame.height, alignment: .center)
            .onAppear {
                isAnimating.toggle()
            }
    }
}

struct LoadingHeart_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .heart)
    }
}
