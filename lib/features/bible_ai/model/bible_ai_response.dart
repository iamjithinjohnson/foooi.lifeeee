class BibleAiResponse {
  final String encouragement;
  final String prayer;
  final String practicalAction;
  final String verse;
  final String reference;

  BibleAiResponse({
    required this.encouragement,
    required this.prayer,
    required this.practicalAction,
    required this.verse,
    required this.reference,
  });

  factory BibleAiResponse.fromJson(Map<String, dynamic> json) {
    String parseValue(dynamic value) {
      if (value == null) return '';
      if (value is String) return value;
      if (value is List) {
        return value.map((item) => "• $item").join('\n');
      }
      return value.toString();
    }

    return BibleAiResponse(
      encouragement: parseValue(json['encouragement']),
      prayer: parseValue(json['prayer']),
      practicalAction: parseValue(json['practical_action']),
      verse: parseValue(json['verse']),
      reference: parseValue(json['reference']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'encouragement': encouragement,
      'prayer': prayer,
      'practical_action': practicalAction,
      'verse': verse,
      'reference': reference,
    };
  }
}
