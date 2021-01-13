//
//  LoadingText.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/13/21.
//

import SwiftUI
import Combine

struct LoadingText: View {
    
    let items: [String] = "Loading...".map { String($0) }
    
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let timing: Double
    
    let maxCounter: Int = 10
    @State var counter = 0

    let frame: CGSize
    let primaryColor: Color
    
    init(color: Color = .black, size: CGFloat = 50, speed: Double = 0.5) {
        timing = speed / 4
        timer = Timer.publish(every: timing, on: .main, in: .common).autoconnect()
        frame = CGSize(width: size, height: size)
        primaryColor = color
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(items.indices) { index in
                Text(items[index])
                    .foregroundColor(primaryColor)
                    .font(.system(size: frame.height / 3, weight: .semibold, design: .default))
                    .offset(y: counter == index ? -frame.height / 8 : 0)
            }
        }
        .frame(height: frame.height, alignment: .center)
        .onReceive(timer, perform: { _ in
            withAnimation(Animation.spring()) {
                counter = counter == (maxCounter - 1) ? 0 : counter + 1
            }
        })
    }
    
}

struct LoadingText_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .text)
    }
}
