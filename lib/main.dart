import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp( MyApp ());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter noficator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotifyApp(title:'flutter notify page'),
    );
  }
}

class NotifyApp extends StatefulWidget {
  const NotifyApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NotifyAppState createState() => _NotifyAppState();
}

class _NotifyAppState extends State<NotifyApp> {
  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate
          ? debugPrint('This device can vibrate')
          : debugPrint('This device cannot vibrate');
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Vibration Example')),
        body: Center(
          child: ListView(children: [
            ListTile(
              title: const Text('Vibrate'),
              leading: const Icon(Icons.vibration, color: Colors.teal),
              onTap: () {
                if (_canVibrate) Vibrate.vibrate;
              },
            ),
          ]),
        ),
      ),
    );
  }
}

