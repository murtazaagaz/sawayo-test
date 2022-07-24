import 'dart:convert';

class Events {
  int eventStart;
  int eventEnd;
  String title;
  Events({
    required this.eventStart,
    required this.eventEnd,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'eventStart': eventStart});
    result.addAll({'eventEnd': eventEnd});
    result.addAll({'title': title});

    return result;
  }

  factory Events.fromMap(Map<String, dynamic> map) {
    return Events(
      eventStart: map['eventStart']?.toInt() ?? 0,
      eventEnd: map['eventEnd']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Events.fromJson(String source) => Events.fromMap(json.decode(source));
}
