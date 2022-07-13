#!/bin/bash

appName=sample

# remove any existing code
rm -rf $appName

# create a sample application
flutter create -a java --org com.microblink $appName

# enter into demo project folder
pushd $appName

IS_LOCAL_BUILD=false || exit 1
if [ "$IS_LOCAL_BUILD" = true ]; then
  # add blinkcard_flutter dependency with local path to pubspec.yaml
  perl -i~ -pe "BEGIN{$/ = undef;} s/dependencies:\n  flutter:\n    sdk: flutter/dependencies:\n  flutter:\n    sdk: flutter\n  blinkcard_flutter:\n    path: ..\/BlinkCard/" pubspec.yaml
  echo "Using blinkcard_flutter from this repo instead from flutter pub"
else
  # add blinkcard_flutter dependency to pubspec.yaml
  perl -i~ -pe "BEGIN{$/ = undef;} s/dependencies:\n  flutter:\n    sdk: flutter/dependencies:\n  flutter:\n    sdk: flutter\n  blinkcard_flutter:/" pubspec.yaml
  echo "Using blinkcard_flutter from flutter pub"
fi

flutter pub get

# enter into android project folder
pushd android

popd

# enter into ios project folder
pushd ios

# install pod
pod install

if false; then
  echo "Replace pod with custom dev version of BlinkID framework"

  pushd Pods/PPBlinkID
  rm -rf Microblink.bundle
  rm -rf Microblink.framework

  cp -r ~/Downloads/blinkid-ios/Microblink.bundle ./
  cp -r ~/Downloads/blinkid-ios/Microblink.framework ./
  popd
fi

# go to flutter root project
popd

cp ../sample_files/main.dart lib/

#update compile and target sdk versions to 31, add android:exported="true" to manifest
sed -i '' 's#compileSdkVersion 30#compileSdkVersion 31#g' ./android/app/build.gradle
sed -i '' 's#targetSdkVersion 30#targetSdkVersion 31#g' ./android/app/build.gradle
sed -i '' 's#android:name=".MainActivity"#android:name=".MainActivity" android:exported="true"#g' ./android/app/src/main/AndroidManifest.xml

echo ""
echo "Go to Flutter project folder: cd $appName"
echo "To run on Android type: flutter run"
echo "To run on iOS: go to $appName/ios and open Runner.xcworkspace; set your development team and add Privacy - Camera Usage Description key to Runner/Info.plist file and press run"
