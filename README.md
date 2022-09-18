Deakin SIT374/SIT764 - RedBack operation

# redback_mobile_app

<<<<<<< HEAD
A new Flutter project.
=======
A new Flutter project for Redback Operations.
>>>>>>> e4e1b1d (Create instructions on how to begin development)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [10 Part Flutter course by Angela YU and London App Brewery](https://www.linkedin.com/learning/flutter-part-01-introduction?trk=learning-topics_learning-search-card_search-card&upsellOrderOrigin=default_guest_learning)
- [Learning Google Flutter for Mobile Developers by Emmanuel Henri](https://www.linkedin.com/learning/learning-google-flutter-for-mobile-developers?trk=learning-course_related-content-card&upsellOrderOrigin=default_guest_learning)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setting Up Flutter
This [GeeksForGeeks](https://www.geeksforgeeks.org/how-to-install-flutter-on-windows/) tutorial shows how to install Flutter from the official website and set it up on Android Studio
For a more follow along approach to installing Flutter you can refer this [YouTube playlist](https://www.youtube.com/watch?v=lkUj76YSMhQ&list=PLMQAFLQy-nKfhqpyh5bNvrt_R23U9LMvx&index=3)

If you are going to use Visual Studio Code for development then the following [video](https://www.youtube.com/watch?v=vBgCgHBMR3c) will help you set it up for development

## Useful Flutter Commands
`flutter doctor` - checks if all requirements are met to run Flutter
`flutter run` - starts the app. Run with --debug flag to optionally run in DEBUG configuration
`flutter pub get` - this runs automatically when opening the project but is used download any packages specified in the `pubspec.yaml` file
`flutter build [platform]` - builds the application for the desired platform (ios for iOS, apk for Android, web for Web)

## Testing on Device
Testing on device is always the preferred method of testing changes as the emulators cannot always guarantee that what you see is what you get
In addition, physical devices offer access to components such as cameras, microphones or onboard sensor data which cannot replicated as easily in an emulator

### Getting started on Android
1. In your terminal, run `flutter doctor` to determine if your environment is properly configured for Android development, if not, resolve the issues which appear before continuing
2. In your terminal, run `flutter build apk`, this will build the Android app and will alert you of any build errors. If there are any build errors, those should be resolved before continuing as well
3. Start Android studio, open the android folder to import the project. If you are using Android Studio as your main development IDE then you'd want to change the view from `Android` to `Project` on the left hand project hierarchy tab
4. Select your development device (emulator or physical device) and then run the application from Android Studio.

### Getting Started on iOS
1. In your terminal, run `flutter doctor` to determine if your environment is properly configured for iOS development, if not, resolve the issues which appear before continuing
2. In your terminal, run `flutter build ios`, this will build the iOS app and will alert you of any build errors. If there are any build errors, those should be resolved before continuing as well
3. Open Xcode, once it launches you need to look up the `ios` directory and open the `Runner.xcworkspace` file. Xcode will then open the project, there will be no dart/swift/objective-c files in the project directory but that is fine
4. If you are developing using a simulator you can just choose a specific simulator and then run the application from XCode.

#### Using a physical iPhone for development
    If you want to develop on a physical device it's going to be a more involved process. It is highly recommended that you only attempt this on a Mac device as trying to emulate a Mac environment to run Xcode on Windows will be a very challenging task  
5. Firstly, make sure you have an [Apple Developer account](https://developer.apple.com/). If you don't have one, you can use your Deakin email to sign up. You don't have to get the paid version, only the free account is necessary
6. Return to Xcode and go the `Accounts` settings and add in your Apple Developer account, once added you should be able to see at least your personal team listed (as well as any others your account is associated with)
7. Open the `Runner.xcodeproj` file from within the project hierarchy, select the `Runner` Target and then select the `Signings & Capabilities` tab, you should see the `Team` dropdown menu. Select the team you want to use for development. Xcode will now update the signing certificate for the app using your development profile
8. Almost done! Select your development device from the device selector and run the application. It will build and run but will stop immediately. On your iPhone, go to `Settings -> General -> VPN & Device Management` and then select on the Developer App tab which corresponds to the email of your Apple Developer account. Press the 'Trust' button which appears at the top and then you will be good to go. Re-run the app from Xcode and it will launch properly
