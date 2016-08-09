## Description

ProgressObserver is a simple subclass of `NSProgress` that provides a delegate API to observe changes in the `completedUnitCount` and `fractionCompleted` key paths.

## Usage

This library can be used in largely the same way as `NSProgress`. There are 2 delegate methods that are called when `fractionCompleted` and `completedUnitCount` are updated. Please read the docs for further information.

If you would like to add observers to more key paths, please open an issue or pull request.

## Requirements

ProgressObserver requires at least iOS 9 and ARC.

## Installation

ProgressObserver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following lines to your Podfile:

    use_frameworks!
    pod "ProgressObserver"

## Documentation

[Docs are available on CocoaDocs](http://cocoadocs.org/docsets/ProgressObserver/)

## Release Notes

####1.0.0
Initial Release

## To-Do

I will be attempting to implement feature to make it easier to calculate estimated time remaining (if feasible) over the coming weeks. Please open an issue if you any ideas for how this class can be made more convenient.

## Author

Ayush Newatia, [ayush.newatia@icloud.com](mailto:ayush.newatia@icloud.com)

## License

ProgressObserver is available under the MIT license. See the LICENSE.md file for more info.
