import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potsdamer_buergerstiftung/screens/events_screen.dart';
import 'package:potsdamer_buergerstiftung/services/directus.dart';
import 'package:potsdamer_buergerstiftung/widgets/app_bar.dart';
import 'package:potsdamer_buergerstiftung/widgets/navigation.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    GetMaterialApp(
      home: const Home(),
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.w700,
          ),
          headline6: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.w700,
          ),
          bodyText1: GoogleFonts.inter(fontWeight: FontWeight.w400),
          bodyText2: GoogleFonts.inter(fontWeight: FontWeight.w400),
        ),
        primaryColor: TW3Colors.emerald.shade500,
      ),
    ),
  );
}

class DirectusController extends GetxController {
  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadDirectus();
    isLoading.value = false;
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final DirectusController d = Get.put(DirectusController());

    return Obx(
      () => d.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: Header(context: context),
              body: EventsScreen(),
              drawer: const Navigation(),
            ),
    );
  }
}
