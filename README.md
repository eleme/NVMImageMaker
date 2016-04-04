# NVMImageMaker

[![CI Status](http://img.shields.io/travis/eleme/NVMImageMaker.svg?style=flat)](https://travis-ci.org/eleme/NVMImageMaker)
[![Version](https://img.shields.io/cocoapods/v/NVMImageMaker.svg?style=flat)](http://cocoapods.org/pods/NVMImageMaker)
[![License](https://img.shields.io/cocoapods/l/NVMImageMaker.svg?style=flat)](http://cocoapods.org/pods/NVMImageMaker)
[![Platform](https://img.shields.io/cocoapods/p/NVMImageMaker.svg?style=flat)](http://cocoapods.org/pods/NVMImageMaker)

## Usage

Use `nvm_beginImage` to start, apply any supported attributes in your drawing chain, just call `make` in the end to get an image:

```
UIImage *image = nvm_beginImage(size)
                     .fillColor(fillColor)
                     .borderColor(borderColor)
                     .cornerRadius(20)
                     .opacity(0.5)
                     .make;
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 7

## Installation

NVMImageMaker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NVMImageMaker"
```

## License

NVMImageMaker is available under the MIT license. See the LICENSE file for more info.

