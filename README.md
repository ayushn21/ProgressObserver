<p align = "center">
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![Pod Version](https://cocoapod-badges.herokuapp.com/v/ProgressObserver/badge.png)](https://cocoapods.org/pods/SwiftLogger)
[![Swift Version](https://img.shields.io/badge/Language-Swift%202.2, 2.3 & 3.0-orange.svg)](https://developer.apple.com/swift)
[![Twitter](https://img.shields.io/badge/Twitter-@AyushN21-blue.svg)](https://twitter.com/ayushn21)
<p>

## Description

ProgressObserver is a simple subclass of `NSProgress` that provides a delegate API to observe changes in the `completedUnitCount` and `fractionCompleted` key paths.

## Usage

This library can be used in largely the same way as `NSProgress`. There are 2 delegate methods that are called when `fractionCompleted` and `completedUnitCount` are updated. Please read the docs for further information.

If you would like to add observers to more key paths, please open an issue or pull request.

## Requirements

ProgressObserver requires at least iOS 9.

## Installation

ProgressObserver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following lines to your Podfile:

    use_frameworks!
    
    # Swift 2.2
    pod "ProgressObserver", '1.0.0'
    
    # Swift 2.3
    pod "ProgressObserver", '1.1.0'
    
    # Swift 3.0
    pod "ProgressObserver", '~> 2.0.0'
    
## Documentation

[Docs are available on CocoaDocs](http://cocoadocs.org/docsets/ProgressObserver/)

## Release Notes

####2.0.0
Migrated code to Swift 3.0.

####1.1.0
Migrated code to Swift 2.3. There will be no new features or patches in for Swift 2.3 after this version.

####1.0.0
Initial Release

## To-Do

I will be attempting to implement feature to make it easier to calculate estimated time remaining (if feasible) over the coming weeks. Please open an issue if you any ideas for how this class can be made more convenient.

## Author

Ayush Newatia, [ayush.newatia@icloud.com](mailto:ayush.newatia@icloud.com)

## License

ProgressObserver is available under the MIT license. See the LICENSE.md file for more info.
