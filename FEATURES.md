# CoreLinkUps Features Documentation

This document provides a detailed overview of all features available in the CoreLinkUps application.

## Table of Contents

1. [Home Screen](#home-screen)
2. [Video Library](#video-library)
3. [Health Articles](#health-articles)
4. [Community Platform](#community-platform)
5. [Fitness Meetups](#fitness-meetups)
6. [Interactive Map](#interactive-map)

---

## Home Screen

### Overview
The home screen serves as the main navigation hub for the application, providing quick access to all major features.

### Features
- **Welcome Banner**: Gradient hero section with app branding
- **Feature Cards**: Grid layout of main features (Videos, Articles, Community, Meetups)
- **Interactive Map Preview**: Quick access to the map view
- **Sample Data Loading**: Automatically loads demo content on first launch

### User Experience
- Clean, modern Material Design 3 interface
- Intuitive card-based navigation
- Responsive layout that adapts to different screen sizes
- Smooth animations and transitions

---

## Video Library

### Overview
A comprehensive video library for fitness tutorials, workout sessions, and wellness content.

### Features

#### Video Browsing
- **Card-based Layout**: Each video displayed with thumbnail, title, and details
- **Duration Display**: Shows video length on thumbnails
- **Category Tags**: Visual categorization (Yoga, HIIT, Meditation, etc.)
- **Description Preview**: Brief description of video content

#### Video Management
- **Add New Videos**: 
  - Enter title, description, and category
  - System generates placeholder thumbnail
  - Validates required fields before submission
- **Sample Videos**: Pre-loaded demo content including:
  - Morning Yoga Routine (15 min)
  - 30-Minute HIIT Workout
  - Meditation for Beginners (10 min)

#### Interactions
- **Watch Button**: Placeholder for video playback
- **Save Button**: Bookmark videos for later viewing
- **Floating Action Button**: Quick access to add new videos

### Technical Details
- Uses `Video` model with properties: id, title, description, thumbnailUrl, videoUrl, duration, category
- State managed through Provider pattern
- Supports YouTube video integration (via youtube_player_flutter)

---

## Health Articles

### Overview
A curated collection of health and wellness articles from experts and community members.

### Features

#### Article Display
- **Rich Card Layout**: Featured image, title, author, and date
- **Category Badges**: Color-coded category indicators
- **Author Information**: Display author name with icon
- **Publication Date**: Formatted date display
- **Content Preview**: First 3 lines of article content

#### Article Reading
- **Full-Screen Dialog**: Read complete articles in a focused view
- **Formatted Content**: Clean typography and spacing
- **Author Attribution**: Prominent author display
- **Category Tag**: Easy identification of article type

#### Article Management
- **Add New Articles**:
  - Title input (required)
  - Full content editor (multi-line, required)
  - Author name (required)
  - Category selection (optional, defaults to "General")
  - Automatic timestamp on creation
- **Sample Articles**: Pre-loaded content on:
  - Benefits of Regular Exercise
  - Nutrition Tips for Athletes
  - Mental Health and Wellness

### Technical Details
- Uses `Article` model with properties: id, title, content, author, publishedDate, imageUrl, category
- Date formatting using `intl` package
- Responsive layout for different screen sizes

---

## Community Platform

### Overview
A social platform for users to share fitness journeys, health tips, and helpful resources.

### Features

#### Post Feed
- **Timeline Layout**: Chronological display of community posts
- **User Avatars**: Circular avatars with initials
- **Author Information**: Username and time since posting
- **Content Display**: Full text of shared thoughts and tips
- **Link Sharing**: 
  - Optional URL attachment to posts
  - Visual link preview with icon
  - Clickable links that open in browser
  - "Open in new" indicator

#### Engagement
- **Like System**:
  - Heart icon with like count
  - Tap to like posts
  - Real-time like counter updates
- **Comment Placeholder**: Future feature for post discussions
- **Share Button**: Share posts with others

#### Creating Posts
- **New Post Dialog**:
  - Author name input (required)
  - Content text area (multi-line, required)
  - Optional link field with URL validation
  - Automatic timestamp on creation
- **Floating Action Button**: Quick access to create new posts

#### Time Display
- **Smart Timestamps**:
  - "Just now" for recent posts
  - "Xm ago" for minutes
  - "Xh ago" for hours
  - "Xd ago" for days
  - Full date (MMM dd) for older posts

### Sample Content
Pre-loaded posts include:
- Fitness achievement celebration
- Article sharing with link
- Community group formation

### Technical Details
- Uses `CommunityPost` model with properties: id, author, content, timestamp, likes, linkUrl
- URL launching via `url_launcher` package
- Real-time state updates with Provider
- Optimistic UI updates for better UX

---

## Fitness Meetups

### Overview
A platform for fitness instructors to post group activities and for users to join fitness meetups.

### Features

#### Meetup Discovery
- **Detailed Cards**: Comprehensive information for each meetup
- **Category Color Coding**:
  - Purple: Yoga
  - Red: HIIT
  - Orange: Running
  - Blue: Cycling
  - Cyan: Swimming
  - Teal: General/Other
- **Availability Status**:
  - Green badge: X spots available
  - Red badge: FULL (no spots remaining)

#### Meetup Information
- **Title and Description**: Clear activity details
- **Instructor Details**: Name with icon
- **Date and Time**: Formatted display (e.g., "Wed, Nov 27 at 2:00 PM")
- **Location**: Full address or venue name
- **Capacity Management**:
  - Current participant count
  - Maximum participant limit
  - Available spots calculation
  - Visual progress indicator

#### Joining Meetups
- **Join Button**:
  - Disabled when meetup is full
  - Updates participant count in real-time
  - Shows confirmation snackbar
  - Prevents over-capacity joins
- **Visual Feedback**: Button changes state based on availability

#### Creating Meetups
- **New Meetup Dialog**:
  - Title input (required)
  - Instructor name (required)
  - Description (multi-line)
  - Location (required)
  - Category selection
  - Default capacity: 20 participants
  - GPS coordinates (default provided, can be customized)

### Sample Meetups
Pre-loaded meetups include:
- Morning Yoga in Central Park
- Beach Bootcamp in Santa Monica
- Group Running Session along Hudson River

### Technical Details
- Uses `Meetup` model with properties: id, title, instructor, description, dateTime, location, latitude, longitude, category, maxParticipants, currentParticipants
- Calculated properties: `isFull`, `availableSpots`
- Date/time formatting with `intl` package
- State management for real-time capacity updates

---

## Interactive Map

### Overview
A visual representation of all fitness meetups on an interactive map, helping users find activities near them.

### Features

#### Map Display
- **Visual Markers**: Location pins for each meetup
- **Interactive Markers**: Tap markers to select meetups
- **Selected State**: 
  - Active marker changes color (blue → red)
  - Shows category label below marker
  - Highlights corresponding list item
- **Map Placeholder**: Demo grid layout (ready for Google Maps integration)

#### Meetup List
- **Synchronized List**: Below map showing all meetups
- **Compact Cards**: Essential information in condensed format
- **Selection Sync**: Tapping list item updates map selection
- **Real-time Count**: Total meetups badge in header

#### List Item Details
- **Location Icon**: Visual marker representation
- **Title**: Meetup name
- **Category Tag**: Activity type
- **Date/Time**: When the meetup occurs
- **Availability Badge**:
  - Green with number: spots available
  - Red "Full": no capacity remaining

#### Visual Feedback
- **Selected State Highlighting**:
  - Elevated card shadow
  - Background color change
  - Marker color change on map
- **Smooth Animations**: Transitions between selections

### Map Integration
Ready for integration with:
- Google Maps for Android/iOS
- Google Maps JavaScript API for Web
- Apple Maps for iOS (alternative)
- OpenStreetMap (free alternative)

### Sample Data
Displays all meetups with:
- Distributed marker positions (demo mode)
- Real GPS coordinates (for production)
- Multiple categories represented

### Technical Details
- Map placeholder with demo grid positioning
- Ready for `google_maps_flutter` integration
- State-based marker and list synchronization
- Responsive layout (60% map, 40% list)
- Tap handlers for both map and list interactions

---

## Cross-Platform Features

All features work seamlessly across:
- **Android**: Native Material Design components
- **iOS**: Cupertino-style adaptations
- **Web**: Responsive web interface
- **Desktop**: macOS, Windows, Linux support

## State Management

All features use the Provider pattern:
- Centralized state in `AppState`
- Real-time UI updates
- Efficient re-rendering
- Clean separation of business logic and UI

## User Experience Highlights

- **Consistent Design**: Material Design 3 throughout
- **Smooth Animations**: Natural transitions between screens
- **Responsive Layout**: Adapts to any screen size
- **Accessibility**: Support for screen readers and large text
- **Dark Mode**: Automatic theme switching
- **Offline-Ready**: Local state management (ready for caching)

## Future Enhancements

Planned features:
1. **Video Playback**: Integrated video player
2. **User Authentication**: Login and profiles
3. **Backend Integration**: API for data persistence
4. **Push Notifications**: Activity reminders
5. **Search and Filters**: Find content easily
6. **Social Sharing**: Share to external platforms
7. **Achievements**: Gamification elements
8. **Calendar Integration**: Sync meetups with device calendar
9. **Real-time Chat**: Community messaging
10. **Advanced Maps**: Route planning and directions

---

For setup instructions, see [SETUP.md](SETUP.md).
For general information, see [README.md](README.md).
