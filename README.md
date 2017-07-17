# Stencil Provider
[![Language](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org) ![Build Status](https://travis-ci.org/BrettRToomey/Jobs.svg?branch=master)
[![codecov](https://codecov.io/gh/BrettRToomey/Jobs/branch/master/graph/badge.svg)](https://codecov.io/gh/BrettRToomey/Jobs)
[![codebeat badge](https://codebeat.co/badges/1a9e0ad5-33d5-4bbc-a229-1691250f69d3)](https://codebeat.co/projects/github-com-brettrtoomey-jobs)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/BrettRToomey/Jobs/master/LICENSE.md)

A Vapor provider and custom command set for [Stencil](https://github.com/kylef/Stencil).

## Integration

#### Vapor Toolbox (Beta)
The latest Vapor [toolbox](https://docs.vapor.codes/2.0/getting-started/toolbox/) beta makes it simple to setup this provider. Just run:
```swift
vapor-beta provider add BrettRToomey/stencil-provider
```

####  Swift Package Manager
Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/BrettRToomey/stencil-provider.git", majorVersion: 0)
```