import 'package:aquaria/classes/user.dart';
import 'package:aquaria/services/http_service.dart';

Future<dynamic> registerUser(username, email, password, confirmPassword) async {
  if (password != confirmPassword) {
    return "Password dosen't match";
  }

  User user = User(username, email, password);
  int? request = await createUser(user);

  if (request == 200) {
    print("User Registeres Successfully !!");
    return user;
  } else {
    print("Failed to register !!");
    return null;
  }
}

Future<dynamic> loginUser(username, password) async {
  //logika buat input (kalo mau)

  User user = User(username, null, password);

  int? request = await verifyUser(user);

  if (request == 200) {
    print("User Logged In Successfully");
    return user;
  } else {
    print("Failed to Log In");
    return null;
  }
}
