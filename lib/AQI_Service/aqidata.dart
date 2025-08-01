import 'package:dio/dio.dart';

class AQIService {
  static Future<Map<String, dynamic>?> fetchAQIData({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final String apikey = 'your api key';
      var response = await Dio().get('http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude&lon=$longitude&appid=$apikey');

      final data = response.data['list'][0];
      return {'aqi': data['main']['aqi'], 'components': data['components']};
    } catch (e) {
      print('Error fetching AQI: $e');
      return null;
    }
  }
}
