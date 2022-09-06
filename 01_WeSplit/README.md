# WeSplit
## 📌 Project1: check-sharing app

This project is a check-sharing app that calculates how to split check based on the number of people & how much tip you want to leave.

## Topics

- Form, Section, NavigationView
- TextField, Picker, ForEach
- ```@State``` Property Wrapper: used when a property needs to be modified
    - allows value to be stored separately by SwiftUI in a place that can be modified
    - allows us to work around limitations of structs (struct's properties are immutable)
    - immutable -> can't change values freely
    
## 💡 Challenges 

From [Hacking with Swift](https://www.hackingwithswift.com/books/ios-swiftui/wesplit-wrap-up):
>[1.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/4e144397d3dafffcca98566883e5caf7fc17082d) Add a header to the third section, saying “Amount per person”.       
>[2.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/191bc53106b6decedda11aeb4df7fd0442ed2d86) Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.            
>[3.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/8cb1f391c82b25a97dc70b950a4056e88bf9a48f) Change the “Number of people” picker to be a text field, making sure to use the correct keyboard type.            
>[Extra challenge](https://github.com/laurakciic/100-days-of-SwiftUI/commit/76480ddbe448e9139f5fc6016ebe3107500d7a79) - Rather than having to type .currency(code: Locale.current.currencyCode ?? "USD") in two places, can you make a new property to store the currency formatter? You’ll need to give your property a specific return type in order to keep the rest of your code happy: FloatingPointFormatStyle<Double>.Currency      

## App Preview

![image1](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/01_WeSplit/01_WeSplit/gitAssets/normal.png)

## 📝 [Quiz Highlights](https://www.hackingwithswift.com/review/ios-swiftui/wesplit)

Two-way bindings are marked with a dollar symbol: $name

<br/>

All SwiftUI views must have a ```body``` property
>This body must always return precisely one view. That view might contain more views inside it, but you still need to return precisely one from the computed property.

<br/>

If we want to modify a property, we need to use a SwiftUI property wrapper such as ```@State```.
>```@State``` tells SwiftUI to store the value somewhere that can be changed freely, outside of our struct.

<br/>

Whenever an ```@State``` property changes, Swift re-invokes our body property.
>This behavior forces all values inside the body to be re-evaluated, making sure they are updated for the changes.




