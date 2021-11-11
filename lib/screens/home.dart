import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_nacigation_with_getx/states/counter_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final CounterController c = Get.put(CounterController());

  goToNext() {
    Get.to(const Other());
  }

  _showSnackBar() {
    Get.snackbar(
      'Title',
      'Message of Snacbar',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  _showDialog() {
    Get.defaultDialog(
      title: 'Dialog',
      content: Column(
        children: [
          Obx(() => Text('This is Simple Dialog ${c.counter}')),
          const TextField(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => goToNext(), child: const Text('Go to next')),
              ElevatedButton(
                  onPressed: () {
                    c.increment();
                  }, child: const Text('Increment')),
            ],
          ),
        ],
      ),
    );
  }

  _showBottomSheet() {
    Get.bottomSheet(
        Wrap(
          children: [
            ListTile(
                leading: const Icon(Icons.music_note),
                title: const Text('Music'),
                onTap: () {
                  c.increment();
                }),
            ListTile(
                leading: const Icon(Icons.videocam),
                title: const Text('Video'),
                onTap: () {
                  c.increment();
                }),
            const SizedBox(height: 100),
          ],
        ),
        backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get package'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => goToNext(), child: const Text('Go To Other')),
            ElevatedButton(
                onPressed: () => _showSnackBar(),
                child: const Text('Snackbar')),
            ElevatedButton(
                onPressed: () => _showDialog(), child: const Text('Dialog')),
            ElevatedButton(
                onPressed: () => _showBottomSheet(),
                child: const Text('BottomSheet')),
            const SizedBox(height: 60),
            Obx(() => Text(
                  'State: ' + c.counter.string,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          c.increment();
        },
      ),
    );
  }
}

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Other Screen'),
            Obx(() => Text('${Get.find<CounterController>().counter}')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<CounterController>().increment();
          },
          child: const Icon(Icons.add)),
    );
  }
}
