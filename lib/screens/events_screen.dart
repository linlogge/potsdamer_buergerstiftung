import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potsdamer_buergerstiftung/services/events/events_service.dart';
import 'package:potsdamer_buergerstiftung/widgets/event_card.dart';

class EventsController extends GetxController {
  var isLoading = true.obs;
  var events = <Event>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    events.value = await EventsService.getEvents();
    isLoading.value = false;
  }
}

class EventsScreen extends StatelessWidget {
  EventsScreen({Key? key}) : super(key: key);

  final EventsController e = Get.put(EventsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (e.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(itemBuilder: (context, index) {
        final event = e.events[index];
        return EventCard(name: event.name, summary: event.summary);
      });
    });
  }
}
