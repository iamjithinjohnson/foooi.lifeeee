import 'package:flutter/material.dart';

enum SessionStatus { completed, locked, active }

class PlanSession {
  final int id;
  final String dayName;
  final String title;
  final String description;
  final String scripture;
  final String reflection;
  final String? voiceUrl;
  final IconData icon;
  SessionStatus status;

  PlanSession({
    required this.id,
    required this.dayName,
    required this.title,
    required this.description,
    required this.scripture,
    required this.reflection,
    this.voiceUrl,
    required this.icon,
    this.status = SessionStatus.locked,
  });
}
