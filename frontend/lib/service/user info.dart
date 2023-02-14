// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';
import 'package:CashManager/model/user.model.dart';

Future<void> saveUser(Users? user) async {
  print(user!.toJson());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('id', user.id!);
  await prefs.setString('email', user.email!);
  await prefs.setString('lastname', user.lastname!);
  await prefs.setString('firstname', user.fistname!);
  await prefs.setString('password', user.password!);
  await prefs.setString('role', user.role!);
}

Future<Users?> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Users? user;
  int? id = prefs.getInt('id');
  if (id != null) {
    user = Users(
        id: prefs.getInt('id')!,
        email: prefs.getString('email'),
        lastname: prefs.getString('lastname'),
        fistname: prefs.getString('firstname'),
        password: prefs.getString('password'),
        role: prefs.getString('role'));
  }
  return user;
}
