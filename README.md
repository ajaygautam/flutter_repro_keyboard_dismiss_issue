# flutter_repro_keyboard_dismiss_issue

Reproduction of issue at https://github.com/MisterJimson/flutter_keyboard_visibility/issues/37

PS: Looks like this issue is not happening with package `keyboard_visibility`. Updated the app to support both `keyboard_visibility` and `flutter_keyboard_visibility`. In `main.dart`, if `switchToKeyboardVisibility`... is set true... the app will use `keyboard_visibility` package. If false, the app will use `flutter_keyboard_visibility`.

Device: iPhone 11 Pro Max, iOS 14.3 

Dev machine: MacBook Air M1 2020, macOS Big Sur v11.1

flutter doctor -v:
```
[✓] Flutter (Channel beta, 1.25.0-8.1.pre, on macOS 11.1 20C69 darwin-arm, locale en-US)
    • Flutter version 1.25.0-8.1.pre at /Users/agautam/tools/flutter
    • Framework revision 8f89f6505b (8 days ago), 2020-12-15 15:07:52 -0800
    • Engine revision 92ae191c17
    • Dart version 2.12.0 (build 2.12.0-133.2.beta)

[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Android SDK at /Users/agautam/Library/Android/sdk
    • Platform android-30, build-tools 30.0.3
    • Java binary at: /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6915495)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 12.3)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Xcode 12.3, Build version 12C33
    • CocoaPods version 1.10.0

[✓] Android Studio
    • Android Studio at /Applications/Android Studio 4.2 Preview.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.8+10-b944.6842174)

[✓] Android Studio (version 4.1)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6915495)

[✓] VS Code (version 1.52.1)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.17.0

[✓] Connected device (1 available)
    • agipe (mobile) • 00008030-000260C202C0802E • ios • iOS 14.3

• No issues found!
```
