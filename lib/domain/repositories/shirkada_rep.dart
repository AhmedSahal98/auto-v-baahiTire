import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:degdeg_app/model/shirkadahaModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShirkadahaRep {
  Future<List<ShirkadaModel>> getData() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(Uri.parse(
          'https://autov.easytouch.cloud/api/method/autov.api.get_package_data?company_id=degdeg&key=4WeU1jsUWaV3'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print('data: $data');
        final List<dynamic> list = data['message']['grouped_data'];
        await prefs.setString('myList', jsonEncode(list));
        return list.map((e) => ShirkadaModel.fromJson(e)).toList();
      } else {
        return _getStoredData(prefs);
      }
    } catch (e) {
      print('Error--: $e');
      return _getStoredData(prefs);
    }
  }

  Future<List<ShirkadaModel>> _getStoredData(SharedPreferences prefs) async {
    final String? storedListString = prefs.getString('myList');

    print('data-: $storedListString');
    if (storedListString != null) {
      final List<dynamic> storedList = jsonDecode(storedListString);

      return storedList.map((e) => ShirkadaModel.fromJson(e)).toList();
    } else {
      return <ShirkadaModel>[];
    }
  }

  Future<List<SlidersModel>> getSliders() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(Uri.parse(
          'https://autov.easytouch.cloud/api/method/autov.api.get_package_data?company_id=degdeg&key=4WeU1jsUWaV3'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> sliders = data['message']['slider'];
        await prefs.setString('sliders', jsonEncode(sliders));

        print('Sliders data: $sliders');
        return sliders.map((e) => SlidersModel.fromJson(e)).toList();
      } else {
        return _getStoredSliders(prefs);
      }
    } catch (e) {
      print("Slider error: $e");
      return _getStoredSliders(prefs);
    }
  }

  Future<List<SlidersModel>> _getStoredSliders(SharedPreferences prefs) async {
    final String? storedListString = prefs.getString('sliders');

    print('sliders-: $storedListString');
    if (storedListString != null) {
      final List<dynamic> storedList = jsonDecode(storedListString);
      return storedList.map((e) => SlidersModel.fromJson(e)).toList();
    } else {
      return <SlidersModel>[];
    }
  }
}
