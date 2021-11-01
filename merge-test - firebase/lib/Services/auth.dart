import 'package:ebutler/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _UserFromFirebaseUser(user));
        .map((_userFromFirebaseUser));
  }

  //sign with email & pass

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // List<String> name = email.split('@');
      // String name2 = name[0].trim();
      await DatabaseService(uid: user.uid).updateUserData(0, 'Empty Order');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
}
