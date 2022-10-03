# InstaFilter
## 📌 Project13: apply filter to photos

![image1]()
![image1]()

## Topics

- UIKit integration, Core Image, Custom bindings, Action Sheets

<br/>

## 💡 Challenges 

From [Hacking with Swift](https://www.hackingwithswift.com/books/ios-swiftui/instafilter-wrap-up):
>[1.]() Try making the Save button disabled if there is no image in the image view.    
           
>[2.]() Experiment with having more than one slider, to control each of the input keys you care about. For example, you might have one for radius and one for intensity.      
  
>[3.]() Explore the range of available Core Image filters, and add any three of your choosing to the app.            

<br/>

## 📝 [Quiz Highlights](https://www.hackingwithswift.com/review/ios-swiftui/instafilter)

The @objc attribute lets Objective-C code call a Swift method.  
>@objc tells Swift to create a method that can be read by Objective-C.  

<br/>

onChange() doesn't use a binding, because it doesn't try to write data back to the value being watched  

<br/>

We can detect when an @State property changes using onChange()

<br/>

To make a SwiftUI view wrap a UIKit view controller, we must make it conform to UIViewControllerRepresentable  

<br/>

A coordinator class lets us handle communication back from a UIKit view controller.
>Coordinators act as bridges between SwiftUI's views and UIKit's view controllers.
>SwiftUI coordinators are specifically designed to act as delegates for another class.

<br/>

SwiftUI's views work great as @State properties.  

<br/>  

NSObject is the root class for everything that comes from UIKit.

<br/>  

It's a good idea to create a CIContext once and re-use it.
