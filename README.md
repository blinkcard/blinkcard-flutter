# BlinkCard SDK Flutter plugin

AI-driven identity credit card scanning for Flutter apps. 

We made it quick and easy to create a sample application or install the plugin into your existing iOS or Android app.

Please note that, for maximum performance and full access to all features, it’s best to go with one of our native SDKs (for [iOS](https://github.com/BlinkCard/blinkcard-ios) or [Android](https://github.com/BlinkCard/blinkcard-android)).

However, since the wrapper is open source, you can add the features you need on your own.


## Requirements
BlinkCard plugin is developed with Flutter SDK version 1.17.5.
For help with Flutter, view official [documentation](https://flutter.dev/docs).

## Getting Started

To get started, first create empty project if needed:
```shell
flutter create project_name
```

Add the blinkcard_flutter dependency to your `pubspec.yaml` file:
```yaml
dependencies:
  ...
  blinkcard_flutter:
```

### Quick start with sample app
To try BlinkCard plugin, you can generate a minimal sample application. To do so run `./initFlutterSample.sh` script.

To run sample application, use the following commands:
```shell
cd sample/
flutter run
```
If there are problems with running the application, please make sure you have
properly configured tools by running `flutter doctor`. You can also try running
the application from VSCode, Android Studio or Xcode.

### Plugin usage
1. Perform scanning by calling the method `MicroblinkScanner.scanWithCamera()` and passing it the `RecognizerCollection` and `OverlaySettings` you wish to use, along with your license key. To find out more about licensing, click
 [here](#licensing).
```dart
Future<void> scan() async {
    List<RecognizerResult> results;
    
    Recognizer recognizer = BlinkCardRecognizer();
    OverlaySettings settings = BlinkCardOverlaySettings();

    // set your license
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "";
    }

    try {
      // perform scan and gather results
      results = await MicroblinkScanner.scanWithCamera(RecognizerCollection([recognizer]), settings, license);

    } on PlatformException {
      // handle exception
    }
```

2. When scanning is completed, variable `results` will contain a list of non-empty `RecognizerResults` from recognizers set in `RecognizerCollection`. You can then access each result individually. If the scanning is manually closed, the method will return an empty list.

For more information please refer to our sample application source code.

### Available API
All available recognizers can be found inside `BlinkCard/lib/recognizers`.

All available overlays can be found inside `BlinkCard/lib/overlays`.

For 100% of features and maximum control, consider using native SDK.

### Platform specifics
Plugin implementation is in folder `lib`, while platform specific implementations are in `android` and `ios` folders.

#### Android
Android folder is fully initialized after running `./initFlutterSample.sh`.

#### iOS
To initialize BlinkCard framework for use with iOS, after you've added the dependency to `blinkcard_flutter` to your `pubspec.yaml`, go to `NameOfYourProject/ios`and run `pod install`.
Our `blinkcard_flutter` depends on the latest MBBlinkCard pod so it will be installed automatically.

To set camera permission usage message, open `NameOfYourProject/ios/Runner.xcworkspace` and under `Runner/Runner/Info.plist` set
`Privacy - Camera Usage Description`.

## Licensing
- A valid license key is required to initialize scanning. You can request a **free trial license key**, after you register, at [Microblink Developer Hub](https://account.microblink.com/signin)
- Get information about pricing and licensing of [BlinkCard](https://microblink.com/blinkcard)
