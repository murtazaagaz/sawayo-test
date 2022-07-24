import 'package:flutter/material.dart';
import 'package:sawayo/core/data/models/events.dart';
import 'package:sawayo/core/repositories/db_rep.dart';
import 'package:sawayo/ui/widgets/calender_slot.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> timings = [];
  List<Events> events = [];
  final DbRep dbRep = DbRep();
  @override
  void initState() {
    super.initState();
    timings = dbRep.getTimings();
    events = dbRep.getEventList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Today')),
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView.builder(
              itemCount: timings.length,
              itemBuilder: ((context, index) {
                return CalenderSlot(
                  time: timings[index],
                  dbRep: dbRep,
                  onDelete: deleteEvent,
                );
              }))),
    );
  }

  void deleteEvent(Events event) {
    dbRep.deleteEvent(event);
    setState(() {});
  }
}
