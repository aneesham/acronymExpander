Goal:
- Create a simple app to look up the meanings of acronyms/initialisms.


To Run in Simulator:
- Open the **AcronymExpander.xcworkspace** in xcode 6 or 7.


Design Approach:
- I decided to go with an elastic or 'instant' search model for the acronyms, to keep
it interesting for the user and also for the user to discover other acronyms along the way.

- I decided to keep the implementation very clean and simple. Thus differed building
a detailed screen with variations of the long form. 
Even though my current model does parse the variations array too.

- I have attempted to make the user experience as simple, interactive and smooth as possible.
The keyboard resigns when the user begins to browse the results.

As listed the 3rd part Libraries I've used are:
- AFNetworking 2.0
- MBProgressHUD
I've used CocoaPods as the dependency manager.

![ScreenShot](https://github.com/aneesham/acronymExpander/blob/master/Images/elasticSearch.png)
![ScreenShot](https://github.com/aneesham/acronymExpander/blob/master/Images/searchResults.png)

