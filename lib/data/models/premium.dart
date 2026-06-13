import 'package:equatable/equatable.dart';

enum PremiumPlan {
  weekly,
  monthly;

  String get label => switch (this) {
        PremiumPlan.weekly => 'Weekly',
        PremiumPlan.monthly => 'Monthly',
      };

  String get price => switch (this) {
        PremiumPlan.weekly => '\$3.99/wk',
        PremiumPlan.monthly => '\$9.99/mo',
      };

  String get storageKey => name;
}

class PostureAnalysis extends Equatable {
  const PostureAnalysis({
    required this.id,
    required this.createdAt,
    required this.issues,
    required this.score,
    required this.summary,
    required this.recommendations,
    required this.deskTips,
  });

  final String id;
  final DateTime createdAt;
  final List<String> issues;
  final int score;
  final String summary;
  final List<String> recommendations;
  final List<String> deskTips;

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'issues': issues,
        'score': score,
        'summary': summary,
        'recommendations': recommendations,
        'deskTips': deskTips,
      };

  factory PostureAnalysis.fromJson(Map<String, dynamic> json) {
    return PostureAnalysis(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      issues: (json['issues'] as List<dynamic>).cast<String>(),
      score: json['score'] as int,
      summary: json['summary'] as String,
      recommendations:
          (json['recommendations'] as List<dynamic>).cast<String>(),
      deskTips: (json['deskTips'] as List<dynamic>).cast<String>(),
    );
  }

  @override
  List<Object?> get props =>
      [id, createdAt, issues, score, summary, recommendations, deskTips];
}

class AiDailyPlan extends Equatable {
  const AiDailyPlan({
    required this.generatedAt,
    required this.focus,
    required this.morning,
    required this.midday,
    required this.evening,
    required this.coachNote,
  });

  final DateTime generatedAt;
  final String focus;
  final String morning;
  final String midday;
  final String evening;
  final String coachNote;

  Map<String, dynamic> toJson() => {
        'generatedAt': generatedAt.toIso8601String(),
        'focus': focus,
        'morning': morning,
        'midday': midday,
        'evening': evening,
        'coachNote': coachNote,
      };

  factory AiDailyPlan.fromJson(Map<String, dynamic> json) {
    return AiDailyPlan(
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      focus: json['focus'] as String,
      morning: json['morning'] as String,
      midday: json['midday'] as String,
      evening: json['evening'] as String,
      coachNote: json['coachNote'] as String,
    );
  }

  @override
  List<Object?> get props =>
      [generatedAt, focus, morning, midday, evening, coachNote];
}
