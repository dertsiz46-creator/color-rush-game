import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class GameModel extends ChangeNotifier {
  int score = 0;
  int highScore = 0;
  int timeLeft = 30;
  int combo = 0;
  int level = 1;
  bool isPlaying = false;
  bool isPaused = false;
  
  bool soundEnabled = true;
  bool vibrationEnabled = true;
  
  final List<Color> gameColors = [
    const Color(0xFFFF4757),
    const Color(0xFF5352ED),
    const Color(0xFF26DE81),
    const Color(0xFFFED330),
    const Color(0xFFA55EEA),
    const Color(0xFFFFA502),
  ];
  
  Color targetColor = const Color(0xFFFF4757);
  List<CircleData> circles = [];
  Timer? gameTimer;
  final Random random = Random();
  
  GameModel() {
    loadHighScore();
  }
  
  Future<void> loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    highScore = prefs.getInt('highScore') ?? 0;
    soundEnabled = prefs.getBool('soundEnabled') ?? true;
    vibrationEnabled = prefs.getBool('vibrationEnabled') ?? true;
    notifyListeners();
  }
  
  Future<void> saveHighScore() async {
    if (score > highScore) {
      highScore = score;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('highScore', highScore);
      notifyListeners();
    }
  }
  
  void startGame() {
    score = 0;
    timeLeft = 30;
    combo = 0;
    level = 1;
    isPlaying = true;
    isPaused = false;
    
    generateCircles();
    startTimer();
    notifyListeners();
  }
  
  void startTimer() {
    gameTimer?.cancel();
    gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!isPaused && isPlaying) {
        timeLeft--;
        if (timeLeft <= 0) {
          endGame();
        }
        notifyListeners();
      }
    });
  }
  
  void generateCircles() {
    circles.clear();
    targetColor = gameColors[random.nextInt(min(3 + level, gameColors.length))];
    
    int circleCount = 6 + (level * 2);
    
    for (int i = 0; i < circleCount; i++) {
      circles.add(CircleData(
        color: gameColors[random.nextInt(min(3 + level, gameColors.length))],
        id: i,
      ));
    }
    
    notifyListeners();
  }
  
  void onCircleTap(CircleData circle) {
    if (!isPlaying || isPaused) return;
    
    if (circle.color == targetColor) {
      score += 10;
      combo++;
      
      if (combo >= 10) {
        score += 25;
      } else if (combo >= 5) {
        score += 10;
      } else if (combo >= 3) {
        score += 5;
      }
      
      if (score > level * 100) {
        level++;
        timeLeft += 5;
      }
      
      if (vibrationEnabled) {
        Vibration.vibrate(duration: 50);
      }
      
      generateCircles();
      
    } else {
      combo = 0;
      score = max(0, score - 5);
      
      if (vibrationEnabled) {
        Vibration.vibrate(duration: 200);
      }
    }
    
    notifyListeners();
  }
  
  void pauseGame() {
    isPaused = true;
    notifyListeners();
  }
  
  void resumeGame() {
    isPaused = false;
    notifyListeners();
  }
  
  void endGame() {
    isPlaying = false;
    gameTimer?.cancel();
    saveHighScore();
    notifyListeners();
  }
  
  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('soundEnabled', soundEnabled);
    await prefs.setBool('vibrationEnabled', vibrationEnabled);
  }
  
  void toggleSound() {
    soundEnabled = !soundEnabled;
    saveSettings();
    notifyListeners();
  }
  
  void toggleVibration() {
    vibrationEnabled = !vibrationEnabled;
    saveSettings();
    notifyListeners();
  }
  
  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }
}

class CircleData {
  final Color color;
  final int id;
  
  CircleData({required this.color, required this.id});
}
