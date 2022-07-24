import 'package:sawayo/core/data/dummy_data_source/dummy_events.dart';
import 'package:sawayo/core/data/dummy_data_source/dummy_working_hours.dart';
import 'package:sawayo/core/data/models/events.dart';
import 'package:sawayo/core/utils/time_utils.dart';

class DbRep {
  List<Events> events = [];

  DbRep() {
    events = DummyEvents.eventList;
  }
  List<String> getTimings() {
    return DummyDataForWorkingHours.timings;
  }

  List<Events> getEventList() {
    return events;
  }

  List<Events> getEventsByTimings(String timing) {
    int timeIn24Hours = TimeUtils.convertTimeIn24(timing);

    List<Events> eventsForTiming = events
        .where((Events events) =>
            events.eventStart <= timeIn24Hours &&
            events.eventEnd > timeIn24Hours)
        .toList();

    return eventsForTiming;
  }

  bool isEventStart(String timing) {
    int timeIn24Hours = TimeUtils.convertTimeIn24(timing);
    return events
        .where((Events events) => events.eventStart == timeIn24Hours)
        .toList()
        .isNotEmpty;
  }

  void deleteEvent(Events event) {
    events.remove(event);
  }
}
