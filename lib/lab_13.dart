import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}


import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> allPlayers = [
    {"name": "Rohit Sharma", "country": "India"},
    {"name": "Virat Kohli ", "country": "India"},
    {"name": "Glenn Maxwell", "country": "Australia"},
    {"name": "Aaron Finch", "country": "Australia"},
    {"name": "Martin Guptill", "country": "New Zealand"},
    {"name": "Trent Boult", "country": "New Zealand"},
    {"name": "David Miller", "country": "South Africa"},
    {"name": "Kagiso Rabada", "country": "South Africa"},
    {"name": "Chris Gayle", "country": "West Indies"},
    {"name": "Jason Holder", "country": "West Indies"},
  ];
  Rx<List<Map<String, dynamic>>> foundPlayers =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    foundPlayers.value = allPlayers;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void filterPlayer(String playerName) {
    List<Map<String, dynamic>> results = [];
    if (playerName.isEmpty) {
      results = allPlayers;
    } else {
      results = allPlayers
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    }
    foundPlayers.value = results;
  }
}


class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Filter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
             onChanged: (value) => controller.filterPlayer(value),
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.foundPlayers.value.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      controller.foundPlayers.value[index]['name'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle:
                      Text(controller.foundPlayers.value[index]['country']),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:get/get.dart';

import 'package:list_view_filter_flutter_getx/app/modules/home/bindings/home_binding.dart';
import 'package:list_view_filter_flutter_getx/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  static const HOME = '/home';
}

