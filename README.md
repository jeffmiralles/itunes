## Application
---
* Supports iOS 14.0+
* iPhone(portrait) and iPad(all orientation)
* Light mode and Dark mode
## Development
---
### Tools
- Xcode 13.0
- Simulator (iPhone and iPad)
- Real device (iPhone 11)
- Framework: SwiftUI, UIKit
- Dependencies: Alamofire, KingFisher
- Swift Package Manager for adding packages or dependencies
### Programming Practice
TDD or Test Driven Development, I use this approach to be able to write unit test and make the project scalable.
Writing failing test first and just coding enough to pass this failing test and repeat the process.

### Design Pattern
I am using MVVM or Model, View, View Model design pattern. Since the introduction of SwiftUI, right of the bat the recommended design pattern to use is MVVM.
The model as usual for the data, the View for UI/UX and interaction with the user, the View Model act as a bridge.

### Persistence
Alamofire for handing URL session related task also with the default caching policy set to Cache-Control: max-age={some number}, This caching mechanism make the request and response to be immediately available for user as soon as he/she use the app often making the app very responsive in terms of user experience.

KingFisher package also use a caching mechanism for images downloaded.

@AppStorage this is SwiftUI and the quivalent of this is the UserDefault class, I am using this to store data locally and as soon as it changes it notifies a view that is using this data.
I am storing trackID to saved the user's selected row and as well as save which screen the user is currently using, so the next time the user opens the app the row is selected and the last screen is presented.
The next use of using the UserDefault storage is the date of users' last visit of the application.

### Code Structure
I organize the codebase in such a way that it is scalable and testable.

Mocks - Contains mocking of data and mocking of services use in the app, this is useful for doing test which does not rely on the network and use this particular files for when the data fetched on the internet is not available or simply means I got no internet connection, It's also useful in cases the Server is downs so development will not be blocked .

Models - Contains data models.

Bridges - I use this whenever I am adding UIKit element to SwiftUI and vice versa.

Components - Reusable views or UI elements throughout the code.

Utilities - Helper type of files.

Networking - URL Session related task.

View Models - Contains the View Models or bridge between Views and Models

### Unit Testing
I am using XCTest framework for writing unit test. Due to time constraint and some issues I faced during the development I haven't done a UITest or automated testing or iOS but this one is also important as it lessen the work of testers or double check every functionality or feature available

### Continues Integration
Using Travis CLI for continues integration so development is faster while tests each build is being done by Travis. Really important for much smoother and continues development process. Continues deployment can also be added using tools such as Fastlane.

*testing the project is much better when run on simulator that is not connected to xCode debugger or the best test is to use real device.

Thank you
-Jeff
