import 'package:absendigital/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create obj user from firebase
  MyUser _userFromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

  //login
  Future login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
