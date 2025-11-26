# CoreLinkUps Setup Guide

This guide will help you set up and run the CoreLinkUps application on your local machine.

## Prerequisites

Before you begin, ensure you have the following installed:

1. **Flutter SDK** (3.0.0 or higher)
   - Download from: https://flutter.dev/docs/get-started/install
   - Add Flutter to your PATH
   - Verify installation: `flutter --version`

2. **Dart SDK** (3.0.0 or higher)
   - Usually comes bundled with Flutter
   - Verify installation: `dart --version`

3. **Development Tools**
   - For Android: Android Studio with Android SDK
   - For iOS: Xcode (Mac only)
   - For Web: Chrome browser
   - A code editor: VS Code, Android Studio, or IntelliJ IDEA

## Initial Setup

### 1. Clone the Repository

```bash
git clone https://github.com/epdsn/HealthLinkUps.git
cd HealthLinkUps
```

### 2. Install Dependencies

Run the following command to download all required packages:

```bash
flutter pub get
```

This will install all dependencies listed in `pubspec.yaml`, including:
- provider (state management)
- go_router (navigation)
- google_maps_flutter (maps)
- video_player (video playback)
- and more...

### 3. Verify Installation

Check that Flutter is properly set up:

```bash
flutter doctor
```

Fix any issues reported by `flutter doctor` before proceeding.

## Running the Application

### Development Mode

#### Run on Connected Device/Emulator

```bash
flutter run
```

This will automatically detect connected devices and emulators. If multiple devices are available, you'll be prompted to select one.

#### Run on Specific Device

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>
```

#### Run on Web

```bash
flutter run -d chrome
```

or

```bash
flutter run -d web-server
```

### Hot Reload

While the app is running in debug mode, you can use hot reload to see changes instantly:
- Press `r` in the terminal to hot reload
- Press `R` in the terminal for hot restart
- Press `q` to quit

## Building for Production

### Android

Build an APK:
```bash
flutter build apk --release
```

Build an App Bundle (recommended for Play Store):
```bash
flutter build appbundle --release
```

Output location: `build/app/outputs/`

### iOS

```bash
flutter build ios --release
```

Then open the Xcode workspace to archive and upload to App Store:
```bash
open ios/Runner.xcworkspace
```

### Web

```bash
flutter build web --release
```

Output location: `build/web/`

Deploy the contents to any web hosting service.

## Project Configuration

### Android Configuration

The Android app is configured in:
- `android/app/build.gradle` - App-level Gradle configuration
- `android/build.gradle` - Project-level Gradle configuration
- `android/app/src/main/AndroidManifest.xml` - App manifest
- `android/app/src/main/kotlin/com/corelinkups/app/MainActivity.kt` - Main activity

Minimum SDK: Android 5.0 (API 21)
Target SDK: Android 14 (API 34)

### iOS Configuration

The iOS app is configured in:
- `ios/Runner/Info.plist` - App configuration

Minimum iOS version: 11.0

### Web Configuration

The web app is configured in:
- `web/index.html` - HTML entry point
- `web/manifest.json` - PWA manifest

## Customization

### Changing App Name

1. In `pubspec.yaml`, update the `name` field
2. In `android/app/src/main/AndroidManifest.xml`, update `android:label`
3. In `ios/Runner/Info.plist`, update `CFBundleDisplayName`

### Changing App Icon

Place your icon files in:
- `android/app/src/main/res/mipmap-*/ic_launcher.png`
- `ios/Runner/Assets.xcassets/AppIcon.appiconset/`

Or use the `flutter_launcher_icons` package for automatic generation.

### Changing Package Name

1. Android: Update `applicationId` in `android/app/build.gradle`
2. iOS: Update bundle identifier in Xcode
3. Update imports and package references throughout the code

## Google Maps Setup (Required for Map Feature)

To use the interactive map feature, you need to configure Google Maps:

### Android

1. Get an API key from Google Cloud Console
2. Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY_HERE"/>
```

### iOS

1. Get an API key from Google Cloud Console
2. Add to `ios/Runner/AppDelegate.swift`:
```swift
GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
```

### Web

Add to `web/index.html` in the `<head>` section:
```html
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY_HERE"></script>
```

## Troubleshooting

### Common Issues

**Issue**: `flutter command not found`
- Solution: Add Flutter to your PATH
- macOS/Linux: Add to `.bashrc` or `.zshrc`: `export PATH="$PATH:/path/to/flutter/bin"`
- Windows: Add to System Environment Variables

**Issue**: Android licenses not accepted
- Solution: Run `flutter doctor --android-licenses`

**Issue**: Xcode not configured (iOS)
- Solution: Install Xcode and run `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`

**Issue**: Web app doesn't load
- Solution: Try `flutter clean` then `flutter run -d chrome`

**Issue**: Dependencies not resolving
- Solution: Delete `pubspec.lock` and run `flutter pub get` again

### Getting Help

If you encounter issues:
1. Check the official Flutter documentation: https://flutter.dev/docs
2. Search Flutter issues on GitHub: https://github.com/flutter/flutter/issues
3. Ask on Stack Overflow with the `flutter` tag
4. Open an issue in this repository

## Development Tips

### State Management

The app uses Provider for state management. The main state is in `lib/services/app_state.dart`.

### Navigation

Navigation is handled by go_router. Routes are defined in `lib/main.dart`.

### Adding New Features

1. Create a new screen in `lib/screens/`
2. Create models in `lib/models/` if needed
3. Add business logic to `lib/services/app_state.dart`
4. Add route in `lib/main.dart`
5. Update UI to link to the new screen

### Code Quality

Run analysis before committing:
```bash
flutter analyze
```

Format code:
```bash
flutter format .
```

Run tests:
```bash
flutter test
```

## Performance Optimization

- Use `const` constructors where possible
- Implement lazy loading for large lists
- Optimize images and assets
- Use `ListView.builder` for long lists
- Profile performance with Flutter DevTools

## Next Steps

1. Set up Google Maps API keys for full map functionality
2. Implement backend API for real data persistence
3. Add user authentication
4. Implement push notifications
5. Add analytics and crash reporting
6. Optimize for production release

For more information, refer to the main README.md file.
