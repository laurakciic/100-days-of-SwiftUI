# Views & Modifiers
## 📌 technique project

Purpose of this project was to get to know more about views & modifiers - what they are, how they work, and why they work as they do. 

<br/>

## Topics

- Views, Modifiers, Composition, Containers

<br/>

## 💡 Challenges 

From [Hacking with Swift](https://www.hackingwithswift.com/books/ios-swiftui/views-and-modifiers-wrap-up):
>[1.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/dc7deb517c91422c0125397f358147f692b42e5f) Go back to project 1 and use a conditional modifier to change the total amount text view to red if the user selects a 0% tip.            
>[2.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/13a33dae2b395e8ed7106eb2383d00d70f9ce8f5) Go back to project 2 and replace the Image view used for flags with a new FlagImage() view that renders one flag image using the specific set of modifiers we had.       
>[3.](https://github.com/laurakciic/100-days-of-SwiftUI/commit/467bdf05f56e765107096035e2702c7142640caf) Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.     

<br/>

## 📝 [Quiz Highlights](https://www.hackingwithswift.com/review/ios-swiftui/wesplit)

The some keyword in some View signals an opaque return type.
>This lets us send back some sort of view without need to say exactly which one.

<br/>

Changing any @State property of a view causes SwiftUI to reinvoke the body property.
>This allows us to change what our views show over time.

<br/>

Local modifiers always override environment modifiers from the parent.
>If a VStack has a foreground color and some text inside also has a foreground color, the text's foreground color is used.

<br/>

Custom view modifiers must conform to the ViewModifier protocol.
>This has one requirement: a body() method that returns some View.

<br/>

View composition refers to combining smaller views into bigger ones.

<br/>

## Preview

![image1](https://github.com/laurakciic/100-days-of-SwiftUI/blob/master/03_Views%26Modifiers/03_Views%26Modifiers/gitAssets/regular.png)







