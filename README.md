# iOS boilerplate 

## How to use
- For fastlane integration, follow instruction on https://github.com/fastlane/fastlane
- A demo of fastlane utilize project can be found here https://github.com/xmartlabs/FastlaneDemo


## Generic task
Task which are common and shared between all projects.

### Network
* [ ] Example API using RxMoya
* [ ] Example for upload images
* [ ] Example for observing data from Firebase
* [ ] JSON Object mapping

### Database
* [ ] Saving / caching image
* [ ] Automatic object mapping from JSON
* [ ] Offline database with `Realm`
* [ ] Observer data changes with `RxRealm`

### Data display ( TableView and CollectionView )
Common features :
* [ ] Pagination 
* [ ] Sort
* [ ] Cell and model separation
* [ ] Loading state
* [ ] Empty data state
* [ ] Pull to refresh

* [ ] Table view 
    * [ ] Table with cache 
    * [ ] Table without cache 
* [ ] Collection view
    * [ ] Collection without cache 
    * [ ] Collection with cache 

### Notification
* [ ] Push notification from normal server 
* [ ] Push notification using `Firebase`
* [ ] Push notification using `OneSignal`
* [ ] Receive notification and navigate to appropriate scene

### Crash report and Analytics
* [ ] Crashlytics
* [ ] Analytics with `Firebase`
* [ ] BuddyBuild SDK
* [ ] Overlay debug screen 
* [ ] API logging using SwiftyBeaver

## Specific task 

### Authorization flow 
* [ ] Sign up form
* [ ] Login form
    * [ ] Login and account not activated
    * [ ] Login with Facebook 
    * [ ] Login with Google Sign In
* [ ] Reset password form
* [ ] Change password form
* [ ] Log out 
    * [ ] Log out from FBSDK
    * [ ] Log out from Google Sign In

## Documentation
* [ ] Convention guideline 
* [ ] Linting options with `SwiftLint`
* [ ] `Buddybuild` setup guideline 
* [ ] `Firebase` setup guideline