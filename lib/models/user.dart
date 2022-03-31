import 'package:image_picker/image_picker.dart';

class User {
  final String name;
  final String email;
  final String? password;
  final XFile? photo;
  String? token;

  User(
      {required this.name,
      required this.email,
      this.photo,
      required this.password,
      this.token});
}
