import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/game_model.dart';

class ColorCircle extends StatefulWidget {
  final CircleData circle;
  final VoidCallback onTap;

  const ColorCircle({
    Key? key,
    required this.circle,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_isTapped) return;
    
    setState(() {
      _isTapped = true;
    });
    
    _controller.forward().then((_) {
      widget.onTap();
      if (mounted) {
        setState(() {
          _isTapped = false;
        });
        _controller.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedScale(
        scale: _isTapped ? 0.8 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            color: widget.circle.color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.circle.color.withOpacity(0.5),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 3,
            ),
          ),
        ),
      ),
    ).animate()
      .fadeIn(duration: 300.ms)
      .scale(
        begin: const Offset(0.5, 0.5),
        end: const Offset(1, 1),
        duration: 300.ms,
        curve: Curves.easeOutBack,
      );
  }
}
