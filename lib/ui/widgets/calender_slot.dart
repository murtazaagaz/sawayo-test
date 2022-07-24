import 'package:flutter/material.dart';
import 'package:sawayo/core/data/models/events.dart';
import 'package:sawayo/core/repositories/db_rep.dart';
import 'package:sawayo/core/utils/time_utils.dart';
import 'package:sawayo/ui/utils/utils.dart';

class CalenderSlot extends StatelessWidget {
  final String time;
  final DbRep dbRep;
  final Function(Events event) onDelete;
  const CalenderSlot(
      {required this.time,
      required this.onDelete,
      required this.dbRep,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> events = _buildEvents(context);
    return SizedBox(
      height: 60,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 40,
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 1,
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        ...events,
                        if (events.isEmpty)
                          Container(
                            height: 1,
                            color: Colors.grey[300],
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }

  List<Widget> _buildEvents(context) {
    final List<Events> events = dbRep.getEventsByTimings(time);
    int index = -1;
    return events.map((Events e) {
      index++;

      double width = (Utils().deviceWidth(context) * .8) - (index * 40);
      String eventTime =
          '${TimeUtils.convertTimeIn12(e.eventStart)} - ${TimeUtils.convertTimeIn12(e.eventEnd)}';
      return Positioned(
        child: GestureDetector(
          onTap: () {
            onDelete(e);
          },
          child: Container(
            width: width,
            color: index < 1 ? Colors.blue : Colors.red,
            height: 60,
            child: e.eventStart == TimeUtils.convertTimeIn24(time)
                ? Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          eventTime,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
        ),
      );
    }).toList();
  }
}
