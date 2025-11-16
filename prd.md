# Color Rush - Product Requirements Document (PRD)

## 1. Product Overview

### 1.1 Product Name
**Color Rush**

### 1.2 Product Description
Color Rush is a hyper-casual mobile game built with Flutter that challenges players to quickly identify and tap circles matching a target color. The game features fast-paced gameplay, combo systems, progressive difficulty, and engaging visual feedback.

### 1.3 Target Audience
- Casual mobile gamers
- Age range: 8-50 years
- Players looking for quick, engaging gameplay sessions
- Fans of reaction-based puzzle games

### 1.4 Platform
- **Primary**: Android & iOS (Flutter framework)
- **Orientation**: Portrait mode only
- **Minimum SDK**: Android 21+ (Lollipop), iOS 12+

---

## 2. Core Gameplay Mechanics

### 2.1 Basic Gameplay Loop
1. Player is shown a target color at the top of the screen
2. A grid of colored circles appears on the screen
3. Player must tap all circles matching the target color
4. Correct taps award points and generate new circles
5. Wrong taps break combos and deduct points
6. Game continues until time runs out (30 seconds base time)

### 2.2 Game Rules
- **Starting Time**: 30 seconds
- **Base Points**: 10 points per correct tap
- **Penalty**: -5 points per wrong tap (minimum 0)
- **Level Progression**: Every 100 points increases level by 1
- **Time Bonus**: +5 seconds added when leveling up

### 2.3 Combo System
- **3x Combo**: +5 bonus points
- **5x Combo**: +10 bonus points
- **10x+ Combo**: +25 bonus points
- Combos reset on wrong taps

### 2.4 Difficulty Progression
- **Colors**: Start with 3 colors, add more as level increases (max 6)
- **Circles**: Start with 6 circles, increase by 2 per level
- **Speed**: More circles = harder to find matching colors

---

## 3. User Interface & Screens

### 3.1 Splash Screen
**Purpose**: Brand introduction and app loading

**Elements**:
- Gradient purple background
- App logo (palette icon)
- App name "COLOR RUSH"
- Tagline: "🎨 Tap & Match Colors"
- Fade-in animation (1.5s)
- Auto-navigate to Home after 3 seconds

### 3.2 Home Screen
**Purpose**: Main menu and game entry point

**Elements**:
- App logo and title
- High score display with trophy icon
- Large "PLAY" button
- Settings button (sound & vibration toggles)
- "How to Play" instructions card
- Gradient background

**Actions**:
- Tap PLAY → Navigate to Game Screen
- Tap Settings → Show settings dialog
- Display best score from local storage

### 3.3 Game Screen
**Purpose**: Main gameplay area

**Top Bar**:
- Back button (quit game)
- Current score display
- Pause button

**Game Info**:
- Timer countdown (red alert when ≤10s)
- Current level indicator
- Combo multiplier (when active)

**Game Area**:
- Target color display (large circle with glow)
- Grid of colored circles (3 columns, dynamic rows)
- Animated circle appearances

**Pause State**:
- "PAUSED" text overlay
- Pause dialog with Resume/Quit options

### 3.4 Game Over Screen
**Purpose**: Display results and offer replay options

**Elements**:
- "GAME OVER" title
- Score card with:
  - Final score (large number)
  - "NEW HIGH SCORE!" badge (if applicable)
  - Level reached
  - Best score
  - Max combo achieved
- Confetti animation (for high scores)
- "PLAY AGAIN" button
- "HOME" button

---

## 4. Features & Functionality

### 4.1 Core Features

#### 4.1.1 Color Matching
- Six vibrant colors:
  - Red (#FF4757)
  - Blue (#5352ED)
  - Green (#26DE81)
  - Yellow (#FED330)
  - Purple (#A55EEA)
  - Orange (#FFA502)
- Random target color selection
- Color difficulty scales with level

#### 4.1.2 Scoring System
- Real-time score updates
- Combo multipliers
- High score persistence using SharedPreferences
- Score displayed throughout gameplay

#### 4.1.3 Timer System
- Countdown from 30 seconds
- Visual warning (red) at 10 seconds
- Time bonuses for leveling up
- Pause/resume capability

#### 4.1.4 Level System
- Dynamic difficulty scaling
- More colors unlocked per level
- More circles per level
- Level indicator always visible

### 4.2 Visual & Audio Features

#### 4.2.1 Animations
- Splash screen fade-in
- Circle scale animations on tap
- Entrance animations for new circles
- Combo counter pop animation
- Score card reveal animation
- Confetti for high scores

#### 4.2.2 Visual Feedback
- Circle glow effects
- Target color highlighting
- Timer color change (warning state)
- Combo display with fire emoji
- New high score badge

#### 4.2.3 Haptic Feedback
- Light vibration on correct tap (50ms)
- Strong vibration on wrong tap (200ms)
- Optional toggle in settings
- Uses Vibration plugin

#### 4.2.4 Sound Effects (Planned)
- Tap sounds
- Correct/wrong feedback
- Level up sound
- Game over sound
- Optional toggle in settings

### 4.3 Data Persistence

#### 4.3.1 Saved Data
- High score
- Sound preference
- Vibration preference

#### 4.3.2 Storage Method
- SharedPreferences for local storage
- Automatic save on game end
- Load on app start

---

## 5. Technical Architecture

### 5.1 State Management
- **Provider Pattern**: Used for global game state
- **GameModel**: Central state management class
- **ChangeNotifier**: For reactive UI updates

### 5.2 Project Structure
```
lib/
├── main.dart                 # App entry point
├── models/
│   └── game_model.dart      # Game logic & state
├── screens/
│   ├── splash_screen.dart   # Splash screen
│   ├── home_screen.dart     # Main menu
│   ├── game_screen.dart     # Gameplay screen
│   └── game_over_screen.dart # Results screen
└── widgets/
    └── color_circle.dart    # Reusable circle widget
```

### 5.3 Key Dependencies
- **flutter**: Core framework
- **provider**: State management (^6.1.1)
- **shared_preferences**: Data persistence (^2.2.2)
- **vibration**: Haptic feedback (^1.8.4)
- **flutter_animate**: Animations (^4.5.0)
- **confetti**: Celebration effects (^0.7.0)
- **audioplayers**: Sound effects (^5.2.1)

### 5.4 Device Requirements
- **Minimum**: Android 5.0 (API 21), iOS 12
- **Orientation**: Portrait only
- **Permissions**: 
  - Vibration (optional)
  - Storage (for SharedPreferences)

---

## 6. User Experience Flow

### 6.1 First Time User
1. App opens → Splash Screen (3s)
2. → Home Screen (shows high score: 0)
3. Reads "How to Play" instructions
4. Taps PLAY button
5. → Game Screen (game starts automatically)
6. Plays until time runs out
7. → Game Over Screen (shows final score)
8. Can replay or return home

### 6.2 Returning User
1. App opens → Splash Screen (3s)
2. → Home Screen (shows previous high score)
3. Taps PLAY
4. → Game Screen
5. Attempts to beat high score
6. → Game Over Screen (confetti if new high score)

### 6.3 Settings Configuration
1. From Home Screen → Tap Settings
2. Settings Dialog appears
3. Toggle Sound on/off
4. Toggle Vibration on/off
5. Changes save automatically
6. Tap Close

---

## 7. Game Balance & Difficulty

### 7.1 Difficulty Curve
- **Level 1**: 3 colors, 6 circles → Easy
- **Level 2**: 4 colors, 8 circles → Moderate
- **Level 3**: 5 colors, 10 circles → Challenging
- **Level 4+**: 6 colors, 12+ circles → Hard

### 7.2 Score Targets
- **Beginner**: 50-100 points
- **Intermediate**: 100-250 points
- **Advanced**: 250-500 points
- **Expert**: 500+ points

### 7.3 Time Management
- Base time: 30 seconds
- +5 seconds per level up
- Maximum theoretical playtime: ~2-3 minutes

---

## 8. Performance Requirements

### 8.1 Performance Targets
- **App Launch**: < 2 seconds to splash screen
- **Screen Transitions**: < 300ms
- **Tap Response**: < 50ms
- **Frame Rate**: 60 FPS minimum
- **Memory**: < 100 MB

### 8.2 Optimization
- Efficient state management
- Minimal rebuilds with Provider
- Optimized animations
- Cached preferences

---

## 9. Future Enhancements (Phase 2)

### 9.1 Potential Features
- **Power-ups**:
  - Time freeze (3 seconds)
  - Score multiplier (2x for 5 seconds)
  - Color hint (highlight all matching colors)

- **Game Modes**:
  - Endless mode (no timer)
  - Zen mode (relaxed, no penalty)
  - Challenge mode (specific targets)

- **Social Features**:
  - Global leaderboards
  - Share scores on social media
  - Friend challenges

- **Monetization**:
  - Rewarded ads for power-ups
  - In-app purchases for themes
  - Ad-free premium version

- **Customization**:
  - Color themes
  - Background options
  - Circle shapes

- **Achievements**:
  - Score milestones
  - Combo achievements
  - Level completion badges

### 9.2 Analytics
- Track user engagement
- Monitor difficulty balance
- Identify drop-off points
- A/B test game parameters

---

## 10. Success Metrics (KPIs)

### 10.1 User Engagement
- **DAU** (Daily Active Users)
- **Session Length**: Average 2-5 minutes
- **Session Frequency**: 3-5 sessions per day
- **Retention**: 
  - Day 1: 40%+
  - Day 7: 20%+
  - Day 30: 10%+

### 10.2 Game Metrics
- **Average Score**: 150-200 points
- **Average Game Duration**: 45-60 seconds
- **Replay Rate**: 70%+ players replay immediately
- **High Score Progression**: Users beat previous score 30% of time

### 10.3 Technical Metrics
- **Crash Rate**: < 0.5%
- **App Rating**: 4.0+ stars
- **Load Time**: < 2 seconds
- **App Size**: < 50 MB

---

## 11. Testing Requirements

### 11.1 Functional Testing
- All screens navigate correctly
- Score calculation is accurate
- Timer countdown works properly
- High score saves and loads
- Settings persist across sessions
- Pause/resume functions correctly

### 11.2 UI/UX Testing
- All text is readable
- Buttons are easily tappable
- Colors are distinguishable
- Animations are smooth
- Layout works on various screen sizes

### 11.3 Performance Testing
- No lag during gameplay
- Smooth animations at 60 FPS
- Memory usage within limits
- Battery drain is acceptable

### 11.4 Device Testing
- Test on Android devices (various sizes)
- Test on iOS devices (various sizes)
- Portrait orientation only
- Different Android versions (API 21+)

---

## 12. Launch Checklist

### 12.1 Pre-Launch
- [ ] All features implemented
- [ ] All screens tested
- [ ] High score system verified
- [ ] Settings persistence confirmed
- [ ] Animations optimized
- [ ] Sound effects implemented (optional)
- [ ] App icon designed
- [ ] Screenshots prepared
- [ ] Store description written

### 12.2 Store Requirements
- [ ] Privacy policy created
- [ ] App store compliance reviewed
- [ ] Age rating determined (Everyone/4+)
- [ ] Permissions justified
- [ ] APK/IPA builds generated
- [ ] Store listings prepared

### 12.3 Post-Launch
- [ ] Monitor crash reports
- [ ] Track user feedback
- [ ] Analyze engagement metrics
- [ ] Plan updates and improvements
- [ ] Community management

---

## 13. Conclusion

Color Rush is designed to be a simple, addictive, and polished hyper-casual game that provides quick entertainment bursts for mobile users. The combination of easy-to-learn mechanics, progressive difficulty, and satisfying feedback creates an engaging experience that encourages repeated play sessions.

The modular architecture and clean codebase make it easy to add new features, adjust game balance, and maintain the application over time. With proper execution and marketing, Color Rush has the potential to reach a wide audience and become a popular casual mobile game.

---

**Document Version**: 1.0  
**Last Updated**: November 2024  
**Status**: Ready for Implementation
