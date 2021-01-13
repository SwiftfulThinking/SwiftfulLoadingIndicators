//
//  LoadingCircleBlinks.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI
import Combine

struct LoadingCircleBlinks: View {
    
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let timing: Double
    
    let maxCounter: Int = 7
    @State var counter = 0

    let frame: CGSize
    let primaryColor: Color
    
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        timing = speed / 2
        timer = Timer.publish(every: timing, on: .main, in: .common).autoconnect()
        frame = CGSize(width: size, height: size)
        primaryColor = color
    }

    var body: some View {
        ZStack {
            ForEach(0..<maxCounter) { index in
                Circle()
                    .fill(primaryColor)
                    .frame(height: frame.height / 5)
                    .frame(width: frame.width, height: frame.height, alignment: .top)
                    .rotationEffect(Angle(degrees: 360 / Double(maxCounter) * Double(index)))
                    .opacity(
                        counter == index ? 1.0 :
                        counter == index + 1 ? 0.5 :
                        counter == (maxCounter - 1) && index == (maxCounter - 1) ? 0.5 :
                        0.0)
            }
        }
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .onReceive(timer, perform: { _ in
            withAnimation(Animation.easeInOut(duration: timing).repeatCount(1, autoreverses: true)) {
                counter = counter == (maxCounter - 1) ? 0 : counter + 1
            }
        })
    }
}

struct LoadingCircleBlinks_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .circleBlinks)
    }
}
