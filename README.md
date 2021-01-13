# SwiftfulLoadingIndicators

A collection of lightweight SwiftUI loading indicators.

## Installation

**Swift Package Manager** 

The Swift Package Manager is a tool for managing the distribution of Swift code. To use SwiftfulLoadingIndicators with Swift Package Manager in an Xcode project:

* File -> Swift Packages -> Add Package Dependency ->
* Add URL for this repository: https://github.com/ndsarno/SwiftfulLoadingIndicators.git

## Usage

Firstly, import the package to your file.
```swift
import SwiftfulLoadingIndicators
```
Then add a LoadingIndicator to your SwiftUI view.

```swift
LoadingIndicator()
```

The indicators are customizeable in terms of animation, color, size, and speed. All parameters are optional and will init with default values if not included. Example implementations:

```swift
// DEFAULT PARAMETERS:
// Animation == .threeBalls
// Color == .primary
// Size == .medium
// Speed == .normal
LoadingIndicator()
LoadingIndicator(animation: .fiveLines)
LoadingIndicator(animation: .fiveLines, color: .red)
LoadingIndicator(animation: .fiveLines, color: .red, size: .large)
LoadingIndicator(animation: .fiveLines, color: .red, size: .large, speed: .fast)
LoadingIndicator(color: .red)
LoadingIndicator(size: .large)
LoadingIndicator(speed: .slow)
```
The indicators will animate as soon as they appear on the screen, similar to the native ProgressView(). Recommended approach is to add the indicator to the View only when it is required:
```swift
if isLoading {
    LoadingIndicator()
}
```

To quickly see all animation options, simply add a LoadingShowcaseView.

```swift
LoadingShowcaseView()
```

To quickly see all size and speed options for a single animation, simply add a LoadingPreviewView.
```swift
LoadingPreviewView(animation: .threeBalls)
```

## Additional Configuration & Notes

All loading indicators are built for SwiftUI. The majority of animations are triggered by toggling a very simple @State variable when they appear. A few of the more complex animations use a Publisher through the  Combine framework.

The animations are meant to be highly customizable and each animation file does not have any external dependencies. If you would prefer to (1) customize one of the animations or (2) only include one of the animations in your project, you can simple copy + paste the source file directly.
* path: SwiftfulLoadingIndicators/Sources/SwiftfulLoadingIndicators/Animations/

**Supported Platforms:**

* .macOS(.v11)
* .iOS(.v13)
* .tvOS(.v14)
* .watchOS(.v7)
