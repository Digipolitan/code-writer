CodeWriter
=================================

[![Swift Package Manager](https://rawgit.com/jlyonsmith/artwork/master/SwiftPackageManager/swiftpackagemanager-compatible.svg)](https://swift.org/package-manager/)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

Helper library cross platform to write & build source code

## Installation

### SPM

To install CodeWriter with SwiftPackageManager, add the following lines to your `Package.swift`.

```swift
let package = Package(
    name: "XXX",
    products: [
        .library(
            name: "XXX",
            targets: ["XXX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Digipolitan/code-writer.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "XXX",
            dependencies: ["CodeWriter"])
    ]
)
```

## The Basics

- Builders

```swift
let builder = CodeBuilder()
builder.add(line: "if test {")
    .rightTab()
    .add(line: "print(\"ok\")")
    .leftTab()
    .add(line: "}")
let res = builder.build()
print("\(res)")
```

**Output**
```
if test {
    print("ok")
}
```

- Writers

The write interface provide the method to override in sub project

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

CodeWriter is licensed under the [BSD 3-Clause license](LICENSE).
