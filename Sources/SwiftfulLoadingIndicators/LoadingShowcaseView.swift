//
//  LoadingShowcaseView.swift
//  SwiftfulLoadingIndicators
//
//  Created by Nick Sarno on 1/12/21.
//

import SwiftUI

public struct LoadingShowcaseView: View {
    
    public init() { }
    
    public var body: some View {
        ScrollView {
            if #available(iOS 14, *) {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ], spacing: 10, content: {
                    ForEach(LoadingIndicator.LoadingAnimation.allCases, id: \.self) { item in
                        VStack(spacing: 10) {
                            LoadingIndicator(animation: item)
                            Text(".\(item.rawValue)")
                                .font(.caption)
                                .minimumScaleFactor(0.1)
                                .lineLimit(1)
                                .padding(.horizontal, 2)
                        }
                    }
                })
            } else {
                VStack {
                    ForEach(LoadingIndicator.LoadingAnimation.allCases, id: \.self) { item in
                        VStack(spacing: 10) {
                            LoadingIndicator(animation: item)
                            Text(".\(item.rawValue)")
                                .font(.caption)
                                .minimumScaleFactor(0.1)
                                .lineLimit(1)
                                .padding(.horizontal, 2)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct LoadingShowcaseView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingShowcaseView()
    }
}
