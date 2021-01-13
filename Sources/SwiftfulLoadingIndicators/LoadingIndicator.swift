//
//  LoadingBuilder.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI

public struct LoadingIndicator: View {
    
    let animation: LoadingAnimation
    let size: CGFloat
    let speed: Double
    let color: Color
    
    public init(
        animation: LoadingAnimation = .threeBalls,
        color: Color = .primary,
        size: Size = .medium,
        speed: Speed = .normal) {
            self.animation = animation
            self.size = size.rawValue
            self.speed = speed.rawValue
            self.color = color
    }
    
    public var body: some View {
        switch animation {
        case .threeBalls: LoadingThreeBalls(color: color, size: size, speed: speed)
        case .threeBallsRotation: LoadingThreeBallsRotation(color: color, size: size, speed: speed)
        case .threeBallsBouncing: LoadingThreeBallsBouncing(color: color, size: size, speed: speed)
        case .threeBallsTriangle: LoadingThreeBallsTriangle(color: color, size: size, speed: speed)
        case .fiveLines: LoadingFiveLines(color: color, size: size, speed: speed)
        case .fiveLinesChronological: LoadingFiveLinesChronological(color: color, size: size, speed: speed)
        case .fiveLinesWave: LoadingFiveLinesWave(color: color, size: size, speed: speed)
        case .fiveLinesCenter: LoadingFiveLinesCenter(color: color, size: size, speed: speed)
        case .fiveLinesPulse: LoadingFiveLinesPulse(color: color, size: size, speed: speed)
        case .pulse: LoadingPulse(color: color, size: size, speed: speed)
        case .pulseOutline: LoadingPulseOutline(color: color, size: size, speed: speed)
        case .pulseOutlineRepeater: LoadingPulseOutlineRepeater(color: color, size: size, speed: speed)
        case .circleTrim: LoadingCircleTrim(color: color, size: size, speed: speed)
        case .circleRunner: LoadingCircleRunner(color: color, size: size, speed: speed)
        case .circleBlinks: LoadingCircleBlinks(color: color, size: size, speed: speed)
        case .circleBars: LoadingCircleBars(color: color, size: size, speed: speed)
        case .doubleHelix: LoadingDoubleHelix(color: color, size: size, speed: speed)
        case .bar: LoadingBar(color: color, size: size, speed: speed)
        case .barStripes: LoadingBarStripes(color: color, size: size, speed: speed)
        case .text: LoadingText(color: color, size: size, speed: speed)
        case .heart: LoadingHeart(color: color, size: size, speed: speed)
        }
    }
    
    public enum LoadingAnimation: String, CaseIterable {
        case threeBalls
        case threeBallsRotation
        case threeBallsBouncing
        case threeBallsTriangle
        case fiveLines
        case fiveLinesChronological
        case fiveLinesWave
        case fiveLinesCenter
        case fiveLinesPulse
        case pulse
        case pulseOutline
        case pulseOutlineRepeater
        case circleTrim
        case circleRunner
        case circleBlinks
        case circleBars
        case doubleHelix
        case bar
        case barStripes
        case text
        case heart
    }
    
    public enum Speed: Double, CaseIterable {
        case slow = 1.0
        case normal = 0.5
        case fast = 0.25
        
        var stringRepresentation: String {
            switch self {
            case .slow: return ".slow"
            case .normal: return ".normal"
            case .fast: return ".fast"
            }
        }
    }

    public enum Size: CGFloat, CaseIterable {
        case small = 25
        case medium = 50
        case large = 100
        case extraLarge = 150
        
        var stringRepresentation: String {
            switch self {
            case .small: return ".small"
            case .medium: return ".medium"
            case .large: return ".large"
            case .extraLarge: return ".extraLarge"
            }
        }
    }
}
