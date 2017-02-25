# Data Persistence 1
A project (Xcode 8.2.1) demonstrating saving user preferences using NSUserDefaults in iOS 10 with Swift 3. This project demonstrates storing a user's preferred/default settings **inside an app** -- not forcing the user to go to a Settings bundle. The key to doing this is to save the user's preferences in a persistent store whenever the user changes those preferences. But saving those preferences is not enough. The Swift code must also read those preferences from the persistent store every time the app opens so that the user will always see their default settings. User settings/preferences must be synchronized with the persistent store.

## Xcode 8.2.1 project settings
**To get this project running on the Simulator or a physical device (iPhone, iPad)**, go to the following locations in Xcode and make the suggested changes:

1. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Signing
- [ ] Tick the "Automatically manage signing" box
- [ ] Select a valid name from the "Team" dropdown
  
2. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Identity
- [ ] Change the "com.yourDomainNameHere" portion of the value in the "Bundle Identifier" text field to your real reverse domain name (i.e., "com.yourRealDomainName.Project-Name").
