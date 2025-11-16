# 🎨 Color Rush

A hyper-casual Flutter mobile game where players match colors against the clock!

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)](https://flutter.dev)

## 📱 About

Color Rush is an engaging, fast-paced color matching game built with Flutter. Players must quickly identify and tap circles matching a target color before time runs out. The game features progressive difficulty, combo systems, haptic feedback, and beautiful animations.

### ✨ Key Features

- 🎯 **Simple Gameplay**: Tap circles matching the target color
- ⚡ **Fast-Paced Action**: 30-second rounds with time bonuses
- 🔥 **Combo System**: Build streaks for bonus points
- 📈 **Progressive Difficulty**: Levels increase in complexity
- 📊 **High Score Tracking**: Local persistence of best scores
- 🎨 **Beautiful UI**: Gradient backgrounds and smooth animations
- 📳 **Haptic Feedback**: Vibration on correct/wrong taps
- ⚙️ **Customizable Settings**: Toggle sound and vibration
- 🎉 **Celebrations**: Confetti animations for high scores

## 🎮 How to Play

1. **Start the Game**: Tap the PLAY button on the home screen
2. **Match the Color**: Look at the target color shown at the top
3. **Tap Quickly**: Tap all circles matching that color
4. **Build Combos**: Consecutive correct taps earn bonus points
5. **Level Up**: Reach 100 points to increase difficulty
6. **Beat the Clock**: Keep playing until time runs out!

### Scoring

- ✅ **Correct Tap**: +10 points
- ❌ **Wrong Tap**: -5 points
- 🔥 **3x Combo**: +5 bonus points
- 🔥 **5x Combo**: +10 bonus points
- 🔥 **10x Combo**: +25 bonus points
- ⬆️ **Level Up**: +5 seconds added to timer

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (included with Flutter)
- Android Studio / Xcode (for mobile deployment)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/dertsiz46-creator/color-rush-game.git
   cd color-rush-game
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For a specific device
   flutter devices
   flutter run -d <device-id>
   ```

### Building for Release

#### Android (APK)
```bash
flutter build apk --release
```

#### Android (App Bundle)
```bash
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

## 📁 Project Structure

```
color-rush-game/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── models/
│   │   └── game_model.dart         # Game logic and state management
│   ├── screens/
│   │   ├── splash_screen.dart      # Initial splash screen
│   │   ├── home_screen.dart        # Main menu
│   │   ├── game_screen.dart        # Active gameplay screen
│   │   └── game_over_screen.dart   # Results and replay screen
│   └── widgets/
│       └── color_circle.dart       # Animated circle widget
├── android/                         # Android-specific files
├── ios/                            # iOS-specific files
├── pubspec.yaml                    # Project dependencies
├── prd.md                          # Product Requirements Document
└── README.md                       # This file
```

## 🎨 Color Palette

The game uses six vibrant colors:

| Color  | Hex Code  | RGB           |
|--------|-----------|---------------|
| Red    | #FF4757   | 255, 71, 87   |
| Blue   | #5352ED   | 83, 82, 237   |
| Green  | #26DE81   | 38, 222, 129  |
| Yellow | #FED330   | 254, 211, 48  |
| Purple | #A55EEA   | 165, 94, 234  |
| Orange | #FFA502   | 255, 165, 2   |

## 🔧 Technologies Used

- **Framework**: Flutter 3.0+
- **Language**: Dart
- **State Management**: Provider
- **Storage**: SharedPreferences
- **Animations**: flutter_animate
- **Haptics**: vibration
- **Effects**: confetti
- **Audio**: audioplayers (planned)

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  provider: ^6.1.1              # State management
  shared_preferences: ^2.2.2    # Local storage
  vibration: ^1.8.4             # Haptic feedback
  flutter_animate: ^4.5.0       # Animations
  confetti: ^0.7.0              # Celebration effects
  audioplayers: ^5.2.1          # Sound effects

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## 🎯 Game Mechanics

### Level System

- **Level 1**: 3 colors, 6 circles
- **Level 2**: 4 colors, 8 circles
- **Level 3**: 5 colors, 10 circles
- **Level 4+**: 6 colors, 12+ circles

### Difficulty Progression

As you score points and level up:
- More colors are introduced
- More circles appear on screen
- Matching becomes more challenging
- Time bonuses keep the game going

## 🎭 Screens

### 1. Splash Screen
- Beautiful animated logo
- Gradient background
- Auto-transitions to home

### 2. Home Screen
- High score display
- Play button
- Settings (sound & vibration)
- How to Play instructions

### 3. Game Screen
- Target color display
- Dynamic circle grid
- Real-time score
- Timer countdown
- Combo counter
- Pause functionality

### 4. Game Over Screen
- Final score
- Statistics (level, best, combo)
- New high score celebration
- Play Again / Home options

## ⚙️ Configuration

### Settings

Players can customize their experience:

- **Sound Effects**: Toggle game sounds on/off (planned)
- **Vibration**: Toggle haptic feedback on/off

Settings are automatically saved and persist across sessions.

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 🚀 Performance

- **Target Frame Rate**: 60 FPS
- **App Size**: ~20-30 MB
- **Memory Usage**: < 100 MB
- **Cold Start**: < 2 seconds
- **Screen Transitions**: < 300ms

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**dertsiz46-creator**

- GitHub: [@dertsiz46-creator](https://github.com/dertsiz46-creator)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- All package contributors
- The Flutter community

## 📮 Support

If you have any questions or need help, please:

1. Check existing [Issues](https://github.com/dertsiz46-creator/color-rush-game/issues)
2. Open a new issue with details
3. Star ⭐ the repository if you find it helpful!

## 🗺️ Roadmap

### Phase 1 (Current) ✅
- [x] Core gameplay mechanics
- [x] Score and level system
- [x] High score persistence
- [x] Basic animations
- [x] Haptic feedback
- [x] Settings menu

### Phase 2 (Planned) 🚧
- [ ] Sound effects implementation
- [ ] Multiple game modes
- [ ] Power-ups system
- [ ] Daily challenges
- [ ] Achievement system
- [ ] Global leaderboards

### Phase 3 (Future) 💡
- [ ] Multiplayer mode
- [ ] Custom themes
- [ ] Social media sharing
- [ ] In-app purchases
- [ ] Localization support

## 📸 Screenshots

*Coming soon! Screenshots will be added after UI testing.*

## 🎬 Demo

*Coming soon! Video demo will be added after testing.*

---

**Made with ❤️ and Flutter**

*Happy Gaming! 🎮*