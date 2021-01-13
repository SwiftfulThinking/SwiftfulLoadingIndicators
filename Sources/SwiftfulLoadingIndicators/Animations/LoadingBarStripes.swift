//
//  LoadingBarStripes.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/13/21.
//

import SwiftUI

struct LoadingBarStripes: View {
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
        ZStack(alignment: .leading) {
            #if canImport(UIKit)
                #if os(tvOS) || os(watchOS)
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color(UIColor.gray))
                #else
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color(UIColor.secondarySystemBackground))
                #endif
            #else
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.gray)
            #endif
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(primaryColor)
                .frame(height: frame.width / 3)
                .rotationEffect(Angle(degrees: -50))
                .offset(x: isAnimating ? frame.width : -frame.width)
                .animation(Animation.linear(duration: timing).repeatForever(autoreverses: false))

            RoundedRectangle(cornerRadius: 25.0)
                .fill(primaryColor)
                .frame(height: frame.width / 3)
                .rotationEffect(Angle(degrees: -50))
                .offset(x: isAnimating ? frame.width : -frame.width)
                .animation(Animation.linear(duration: timing).repeatForever(autoreverses: false).delay(timing / 3))

            RoundedRectangle(cornerRadius: 25.0)
                .fill(primaryColor)
                .frame(height: frame.width / 3)
                .rotationEffect(Angle(degrees: -50))
                .offset(x: isAnimating ? frame.width : -frame.width)
                .animation(Animation.linear(duration: timing).repeatForever(autoreverses: false).delay(timing / 3 * 2))

        }
        .frame(width: frame.width, height: frame.height / 10, alignment: .center)
        .clipped()
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .onAppear {
            isAnimating.toggle()
        }
    }
}

struct LoadingBarStripes_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .barStripes)
    }
}
