import 'package:health/health.dart';

class HealthService {
  HealthFactory health = HealthFactory();

  Future<void> fetchHealthData() async {
    // درخواست مجوز برای دسترسی به داده‌های سلامت (مثلا تعداد قدم‌ها)
    bool authorized = await health.requestAuthorization([HealthDataType.STEPS]);

    if (authorized) {
      // مشخص کردن محدوده زمانی برای دریافت داده‌ها
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 7));

      // دریافت داده‌ها
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          startDate, endDate, [HealthDataType.STEPS]);

      // پردازش داده‌ها
      if (healthData.isNotEmpty) {
        for (var data in healthData) {
          print('Steps: ${data.value}');
        }
      } else {
        print('No health data found.');
      }
    } else {
      print('Authorization denied.');
    }
  }
}
