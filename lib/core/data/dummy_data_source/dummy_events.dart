import 'package:sawayo/core/data/models/events.dart';

class DummyEvents {
  static final List<Events> eventList = [
    Events(eventStart: 13, eventEnd: 15, title: 'Meeting'),
    Events(eventStart: 14, eventEnd: 15, title: 'Lunch'),
    Events(eventStart: 16, eventEnd: 20, title: 'Audit'),
    Events(eventStart: 9, eventEnd: 10, title: 'Office Work'),
    Events(eventStart: 12, eventEnd: 13, title: 'Critical Thinking'),
  ];
}
