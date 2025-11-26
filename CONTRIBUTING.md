# Contributing to CoreLinkUps

Thank you for your interest in contributing to CoreLinkUps! This document provides guidelines and instructions for contributing to the project.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Development Setup](#development-setup)
3. [How to Contribute](#how-to-contribute)
4. [Coding Standards](#coding-standards)
5. [Pull Request Process](#pull-request-process)
6. [Reporting Issues](#reporting-issues)
7. [Community Guidelines](#community-guidelines)

## Getting Started

### Prerequisites

Before you begin, make sure you have:
- Flutter SDK (3.0.0+) installed
- Git installed and configured
- A GitHub account
- Basic knowledge of Dart and Flutter
- Read the [README.md](README.md) and [SETUP.md](SETUP.md)

### First-Time Setup

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/HealthLinkUps.git
   cd HealthLinkUps
   ```
3. Add the original repository as upstream:
   ```bash
   git remote add upstream https://github.com/epdsn/HealthLinkUps.git
   ```
4. Install dependencies:
   ```bash
   flutter pub get
   ```
5. Verify everything works:
   ```bash
   flutter analyze
   flutter test
   ```

## Development Setup

### Creating a Branch

Always create a new branch for your changes:

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

Branch naming conventions:
- `feature/` - for new features
- `fix/` - for bug fixes
- `docs/` - for documentation changes
- `refactor/` - for code refactoring
- `test/` - for adding tests

### Running the App

```bash
# Run in debug mode
flutter run

# Run with specific device
flutter run -d <device-id>

# Run in release mode
flutter run --release
```

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/models_test.dart

# Run with coverage
flutter test --coverage
```

### Code Analysis

```bash
# Analyze code
flutter analyze

# Format code
flutter format .

# Fix common issues automatically
dart fix --apply
```

## How to Contribute

### Types of Contributions

We welcome various types of contributions:

1. **Bug Fixes** - Fix issues and bugs
2. **New Features** - Add new functionality
3. **Documentation** - Improve or add documentation
4. **Tests** - Add or improve test coverage
5. **UI/UX Improvements** - Enhance user interface and experience
6. **Performance Optimizations** - Improve app performance
7. **Code Refactoring** - Improve code quality

### Finding Issues to Work On

- Check the [Issues](https://github.com/epdsn/HealthLinkUps/issues) page
- Look for issues labeled `good first issue` for beginners
- Look for issues labeled `help wanted` for contributions needed
- Comment on the issue to let others know you're working on it

## Coding Standards

### Flutter/Dart Style Guide

Follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style):

1. **Naming Conventions**
   - Classes: `PascalCase`
   - Variables/Functions: `camelCase`
   - Constants: `lowerCamelCase`
   - Files: `snake_case.dart`

2. **Code Formatting**
   - Use `flutter format` before committing
   - Line length: 80 characters (soft limit)
   - Use trailing commas for better formatting

3. **Documentation**
   - Add doc comments for public APIs
   - Use `///` for documentation comments
   - Provide examples in comments when helpful

### Project-Specific Guidelines

1. **State Management**
   - Use Provider for state management
   - Keep business logic in services
   - Keep widgets focused on UI

2. **File Organization**
   - Models go in `lib/models/`
   - Screens go in `lib/screens/`
   - Services go in `lib/services/`
   - Reusable widgets go in `lib/widgets/`

3. **Widget Structure**
   - Prefer StatelessWidget when possible
   - Extract complex widgets into separate classes
   - Use const constructors where applicable

4. **Error Handling**
   - Handle errors gracefully
   - Provide user feedback
   - Log errors appropriately

5. **Testing**
   - Write tests for new features
   - Maintain or improve test coverage
   - Test edge cases and error conditions

### Code Example

```dart
/// A card widget that displays meetup information.
///
/// Shows the title, instructor, date, location, and participant count
/// for a fitness meetup.
class MeetupCard extends StatelessWidget {
  /// Creates a meetup card.
  const MeetupCard({
    required this.meetup,
    super.key,
  });

  /// The meetup to display.
  final Meetup meetup;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meetup.title,
              style: theme.textTheme.titleLarge,
            ),
            // ... more widgets
          ],
        ),
      ),
    );
  }
}
```

## Pull Request Process

### Before Submitting

1. **Update from upstream**:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Run checks**:
   ```bash
   flutter analyze
   flutter test
   flutter format .
   ```

3. **Test your changes**:
   - Test on multiple platforms if possible
   - Verify no regressions
   - Test edge cases

4. **Update documentation**:
   - Update README if needed
   - Add/update comments
   - Update CHANGELOG if applicable

### Submitting a Pull Request

1. **Commit your changes**:
   ```bash
   git add .
   git commit -m "feat: add new feature description"
   ```

   Commit message format:
   - `feat:` - new feature
   - `fix:` - bug fix
   - `docs:` - documentation changes
   - `style:` - formatting changes
   - `refactor:` - code refactoring
   - `test:` - adding tests
   - `chore:` - maintenance tasks

2. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

3. **Create Pull Request**:
   - Go to the original repository on GitHub
   - Click "New Pull Request"
   - Select your branch
   - Fill in the PR template:
     - Clear title describing the change
     - Detailed description of what and why
     - Reference related issues (e.g., "Fixes #123")
     - Screenshots for UI changes
     - Testing performed

4. **Address Review Comments**:
   - Respond to all review comments
   - Make requested changes
   - Push updates to the same branch
   - Re-request review when ready

### PR Review Criteria

Your PR will be reviewed for:
- Code quality and style compliance
- Test coverage
- Documentation completeness
- No breaking changes (or properly documented)
- Performance impact
- Security considerations

## Reporting Issues

### Bug Reports

When reporting a bug, include:

1. **Description**: Clear description of the bug
2. **Steps to Reproduce**:
   - Step-by-step instructions
   - Code samples if relevant
3. **Expected Behavior**: What should happen
4. **Actual Behavior**: What actually happens
5. **Environment**:
   - Flutter version (`flutter --version`)
   - Device/Platform
   - OS version
6. **Screenshots**: If applicable
7. **Logs**: Error messages or stack traces

### Feature Requests

When requesting a feature, include:

1. **Description**: Clear description of the feature
2. **Use Case**: Why is this feature needed?
3. **Proposed Solution**: How would you implement it?
4. **Alternatives**: Other approaches you've considered
5. **Additional Context**: Screenshots, mockups, etc.

## Community Guidelines

### Code of Conduct

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Respect different viewpoints and experiences
- Accept constructive criticism gracefully
- Show empathy towards others

### Communication

- **GitHub Issues**: For bugs and feature requests
- **Pull Requests**: For code contributions
- **Discussions**: For general questions and ideas

### Getting Help

If you need help:
1. Check existing documentation
2. Search closed issues for similar problems
3. Ask in GitHub Discussions
4. Provide enough context for others to help

## Recognition

Contributors will be:
- Listed in the project's contributors page
- Credited in release notes
- Mentioned in documentation updates

Thank you for contributing to CoreLinkUps! 🎉

---

Questions? Open an issue or start a discussion!
