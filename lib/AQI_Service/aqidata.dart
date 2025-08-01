import 'package:dio/dio.dart';

class AQIService {
  static Future<Map<String, dynamic>?> fetchAQIData({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final String apikey = '4c0da3560ead6dfd6901ff0b5b7116f8';
      var response = await Dio().get('your api key ');

      final data = response.data['list'][0];
      return {'aqi': data['main']['aqi'], 'components': data['components']};
    } catch (e) {
      print('Error fetching AQI: $e');
      return null;
    }
  }
}
