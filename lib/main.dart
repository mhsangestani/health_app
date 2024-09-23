import 'package:flutter/material.dart';
import 'health_service.dart';  // Import کردن سرویس

void main() {
  runApp(MyApp());
  HealthService().fetchHealthData();  // گرفتن داده‌ها در هنگام اجرای اپلیکیشن
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health App'),
        ),
        body: Center(
          child: Text('Fetching health data...'),
        ),
      ),
    );
  }
}
