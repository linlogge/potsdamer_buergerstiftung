import 'package:potsdamer_buergerstiftung/services/directus.dart';

class Event {
  String name;
  String summary;
  String? description;

  Event({required this.name, required this.summary, this.description});

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(name: map['name'], summary: map['summary']);
  }
}

class EventsService {
  static Future<List<Event>> getEvents() async {
    var res = await directus.items("events").readMany();
    return res.data.map((e) => Event.fromMap(e)).toList();
  }
}
