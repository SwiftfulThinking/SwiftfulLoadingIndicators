//
//  LoadingPreviewView.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/11/21.
//

import SwiftUI
import Combine

public struct LoadingPreviewView: View {
        
    let animation: LoadingIndicator.LoadingAnimation
    let sizes = LoadingIndicator.Size.allCases
    let speeds = LoadingIndicator.Speed.allCases
    
    public init(animation: LoadingIndicator.LoadingAnimation) {
        self.animation = animation
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                Text("SIZES")
                    .font(.title)
                    .fontWeight(.semibold)
                    .underline()
                
                ForEach(sizes, id: \.self) { size in
                    VStack(spacing: 0) {
                        LoadingIndicator(animation: animation, size: size, speed: .normal)
                        Text(size.stringRepresentation)
                            .font(.caption)
                    }
                }
            }
            Divider()
            VStack {
                Text("SPEEDS")
                    .font(.title)
                    .fontWeight(.semibold)
                    .underline()

                ForEach(speeds, id: \.self) { speed in
                    VStack(spacing: 0) {
                        LoadingIndicator(animation: animation, size: .medium, speed: speed)
                        Text(speed.stringRepresentation)
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPreviewView(animation: .threeBalls)
    }
}
