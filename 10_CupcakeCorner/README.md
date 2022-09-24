# Cupcake Corner
## 📌 Project10: order cupcakes online

![image1](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/10_CupcakeCorner/10_CupcakeCorner/gitAssets/n1.png)
![image2](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/10_CupcakeCorner/10_CupcakeCorner/gitAssets/n2.png)
![image3](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/10_CupcakeCorner/10_CupcakeCorner/gitAssets/n3.png)
![image4](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/10_CupcakeCorner/10_CupcakeCorner/gitAssets/n4.png)

## Topics

- Codable, URLSession, disabled()

<br/>

## 💡 Challenges 

From [Hacking with Swift](https://www.hackingwithswift.com/books/ios-swiftui/cupcake-corner-wrap-up):
>[1.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/9fa99be80985806c890dd7bf7867b021fe585d59) Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.    
>[2.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/200c6988207637e71f6967a96c696a1ad9630a41) If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, just disable WiFi on your Mac so the simulator has no connection either.    
>[3.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/9fa99be80985806c890dd7bf7867b021fe585d59) For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.     

<br/>

## 📝 [Quiz Highlights](https://www.hackingwithswift.com/review/ios-swiftui/cupcake-corner)

Asynchronous functions are able to sleep while their work completes.
>This allows our app to perform other work at the same time.

<br/>

Swifts arrays use generics.
>This means we make arrays of strings or integers – we can't make an untyped array.

<br/>

The @Published property wrapper places our properties inside a Published struct.
>Behind the scenes, this is actually similar to how optionals work.

<br/>

Swift can't tell at compile time which asynchronous functions will sleep and which won't, so we must always call them using await.

<br/>

Strings, integers, and Booleans already conform to Codable.

<br/>

The CodingKey protocol lets us list the properties we want to archive and unarchive as enum cases.
>Any that aren't included as cases can't be archived.

<br/>

Structs cannot be used with @ObservedObject.

<br/>

HTTP GET calls are designed to read data, and POST calls are designed to write data.
>If you ever saw an alert from your web browser saying asking if you really wanted to submit a form again, that was because it was sent using HTTP POST.

<br/>

It's common to use the shared property of URLSession rather than creating a new session ourselves.
>You should create your own session if you need custom functionality.

<br/>

When a URLSession download completes, it will send back the downloaded data plus any additional metadata.
>These values are passed back in a tuple, and you can use _ to ignore either of them.
