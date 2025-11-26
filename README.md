# CoreLinkUps

CoreLinkUps is a cross-platform health and fitness application designed to bring people together through knowledge, community, and real-world activity. Built with Flutter for seamless performance across devices, CoreLinkUps empowers users to take charge of their wellness journey in a dynamic, interactive way.

## Features

### 🎥 Video Library
- Watch fitness tutorial videos
- Browse videos by category (Yoga, HIIT, Meditation, etc.)
- Add and share your own workout videos
- Save videos to watch later

### 📰 Health Articles
- Read expert articles on health, nutrition, and wellness
- Browse articles by category
- Add your own health tips and articles
- Stay updated with the latest health trends

### 👥 Community Platform
- Share your fitness journey and health tips
- Post links to helpful resources
- Like and comment on community posts
- Connect with like-minded health enthusiasts

### 🏃 Fitness Meetups
- Browse group fitness activities near you
- Post your own fitness classes and meetups
- Join meetups with available spots
- See instructor details and class descriptions
- Track participant counts in real-time

### 🗺️ Interactive Map
- Visualize all fitness meetups on an interactive map
- View meetup locations and details
- Filter meetups by category and availability
- Find activities near your location

## Technology Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: Provider
- **Routing**: go_router
- **UI Components**: Material Design 3
- **Maps**: Google Maps Flutter (integrated)
- **Video Player**: YouTube Player Flutter
- **Storage**: Shared Preferences

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode (for mobile development)
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/epdsn/HealthLinkUps.git
cd HealthLinkUps
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# For development
flutter run

# For web
flutter run -d chrome

# For specific device
flutter run -d <device_id>
```

### Building for Production

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

#### Web
```bash
flutter build web --release
```

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── models/                   # Data models
│   ├── video.dart
│   ├── article.dart
│   ├── community_post.dart
│   └── meetup.dart
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── videos_screen.dart
│   ├── articles_screen.dart
│   ├── community_screen.dart
│   ├── meetups_screen.dart
│   └── map_screen.dart
├── services/                 # Business logic and state
│   └── app_state.dart
└── widgets/                  # Reusable widgets
```

## Features in Detail

### Home Screen
The home screen provides quick access to all major features through an intuitive card-based interface with a beautiful gradient hero section.

### Videos Section
- Grid/list view of fitness videos
- Category filtering
- Video duration display
- Add new videos with title, description, and category

### Articles Section
- Article cards with author and publication date
- Read full articles in a dialog
- Category badges for easy identification
- Add new articles with full content

### Community Section
- Timeline-style feed of community posts
- Like and share functionality
- Link sharing with URL preview
- Time-ago timestamps for posts
- Add new posts with optional links

### Meetups Section
- Detailed meetup cards with all information
- Category color coding
- Participant tracking
- Join/leave functionality
- Date, time, and location display

### Map Screen
- Visual representation of meetup locations
- Interactive markers
- Selected meetup highlighting
- List view synchronized with map
- Filter by availability

## Cross-Platform Support

CoreLinkUps runs on:
- ✅ Android (5.0 and above)
- ✅ iOS (11.0 and above)
- ✅ Web (Chrome, Firefox, Safari, Edge)
- ✅ macOS
- ✅ Windows
- ✅ Linux

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the GitHub repository or contact the development team.

## Acknowledgments

- Flutter team for the amazing framework
- The open-source community for various packages used
- All contributors to this project
