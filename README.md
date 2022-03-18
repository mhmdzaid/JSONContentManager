# JSONContentManager

[![CI Status](https://img.shields.io/travis/mozead1996/JSONContentManager.svg?style=flat)](https://travis-ci.org/mozead1996/JSONContentManager)
[![Version](https://img.shields.io/cocoapods/v/JSONContentManager.svg?style=flat)](https://cocoapods.org/pods/JSONContentManager)
[![License](https://img.shields.io/cocoapods/l/JSONContentManager.svg?style=flat)](https://cocoapods.org/pods/JSONContentManager)
[![Platform](https://img.shields.io/cocoapods/p/JSONContentManager.svg?style=flat)](https://cocoapods.org/pods/JSONContentManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

swift version 5.0 , iOS 12

## Installation

JSONContentManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JSONContentManager'
```

## How to use?
let's assume we have a json file like this : 
```json 
{
"Employees": [
    {
        "name": "Joe",
        "role": "developer"
    },
    {
        "name": "wu jan",
        "role": "product owner"
    },
    {
        "name": "nicky",
        "role": "sales manager"
    }],

    "Product": {
        "name": "coffee machine",
        "specs": {
         "height": 40,
         "weight": "12kg"
        },
        "bill": "you paid {0} of {1}."
    }
}

```
First import JSONContentManager in your code 
```swift
import JSONContentManager
```
Then create instance of JSONContentManager and pass json file name as a parameter 
 ```swift
let contentManager = JSONContentManager.init(JSONFile: "ExampleJSONFile")
```
After that you can get value by passing its keys path like that : 
 ```swift
let value = contentManager.value(from: "Product.specs.height") // value = 40 
```
Also you can add external values to the value by passing it as placeHolders as follows:
 ```swift
let value = contentManager.stringValue(from: "Product.bill",
                                                     placeholders: ["12.35$","40,30$"]) // you paid 12.35$ of 40,30$.
```
## Author

mozead1996, mohamedzead2021@gmail.com

## License

JSONContentManager is available under the MIT license. See the LICENSE file for more info.
