import 'package:shared_preferences/shared_preferences.dart';

Future SaveLoginData(String? token) async {

  if(token != null && token.isNotEmpty){

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}

Future<String?> GetLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     var token = prefs.getString('token');
    print(token);

    return token;

}