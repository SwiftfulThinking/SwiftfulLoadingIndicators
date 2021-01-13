//
//  LoadingFiveLines.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI
import Combine

struct LoadingFiveLines: View {
    
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let timing: Double
    
    let maxCounter: Int = 5
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
        HStack(spacing: frame.width / 10) {
            ForEach(0..<maxCounter) { index in
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(primaryColor)
                    .frame(maxHeight:
                            counter == index ? frame.height / 3 : .infinity
                    )
            }
        }
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .onReceive(timer, perform: { _ in
            withAnimation(.easeInOut(duration: timing)) {
                counter = counter == (maxCounter - 1) ? 0 : counter + 1
            }
        })
    }
}

struct LoadingFiveLines_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .fiveLines)
    }
}
