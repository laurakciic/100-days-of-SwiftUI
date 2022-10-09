# BucketList
## 📌 Project14

BucketList is an app that lets the user build a private list of places on the map that they intend to visit one day, add a description for that place, look up interesting places that are nearby, and save it all to the iOS storage for later.

![image1](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/14_BucketList/14_BucketList/gitAssets/1.png)
![image2](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/14_BucketList/14_BucketList/gitAssets/2.png)
![image3](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/14_BucketList/14_BucketList/gitAssets/3.png)

## Topics

- MapKit, Biometric authentication, Secure data writing, Comparable custom types, Documents directory   

<br/>

## 💡 Challenges 

From [Hacking with Swift](https://www.hackingwithswift.com/books/ios-swiftui/bucket-list-wrap-up):
>[1.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/49c7905cd62b2025fdf39e8b69a0597462ff5878)    Our + button is rather hard to tap. Try moving all its modifiers to the image inside the button – what difference does it make, and can you think why?    
           
>[2.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/39ce403fc022abe2b79f3fc3a7d8e6e1b1101a19)       Our app silently fails when errors occur during biometric authentication, so add code to show those errors in an alert.    
  
>[3.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/a89e138426c17bef604e54a7128348c735f9b0b3)         Create another view model, this time for EditView. What you put in the view model is down to you, but I would recommend leaving dismiss and onSave in the view itself – the former uses the environment, which can only be read by the view, and the latter doesn’t really add anything when moved into the model.   
Tip: That last challenge will require you to make a StateObject instance in your EditView initializer – remember to use an underscore with the property name!  
    
    
[Additional challenge](), from [here](https://www.hackingwithswift.com/books/ios-swiftui/writing-data-to-the-documents-directory):   

Before we move on, here’s a small challenge for you: back in project 8 we looked at how to create a generic extension on Bundle that let us find, load, and decode any Codable data from our app bundle. Can you write something similar for the documents directory, perhaps making it an extension on FileManager?
   
<br/>

## 📝 [Quiz Highlights](https://www.hackingwithswift.com/review/ios-swiftui/bucket-list)

 iOS can take care of file encryption for using the .completeFileProtection option.
>This stops anyone from reading the file unless the device has been unlocked.

<br/>

MapAnnotation lets us place any kind of SwiftUI views into our maps.

<br/>

Using MapMarker doesn't allow us to add text to the map.

<br/>

Writing data atomically means that iOS writes to a temporary file then performs a rename.
>This stops another piece of code from reading the file part-way through a write.

<br/>

Every iOS app has a documents directory where we can store our files.
>This directory is automatically stored in iCloud backups.

<br/>

Classes that conform to the ObservableObject protocol should have @MainActor attribute

<br/>  

The CL in CLLocationCoordinate2D stands for Core Location.
>Core Location is separate from MapKit, and allows us to do things like read the user's location.

<br/>  

SwiftUI does not let us bind a text field directly to an optional string property.
We can however bind a computed property that wraps the optional.

<br/>  

Calling data(from:) on a URLSession must be done with await.
>Networking takes some time to complete, so you should never let it block your UI work.

<br/>  

Map annotation data must conform to Identifiable.
This helps SwiftUI detect when annotations have changed, so they can be refreshed.
