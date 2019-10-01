import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  static User _user;
  String _photoUrl;
  String _email;
  String _displayName;
  String _password;

  User._({String photoUrl, String email, String displayName}) {
    this._photoUrl = photoUrl;
    this._email = email;
    this._displayName = displayName;
  }

  static Future<User> _getInstance(
      {String photoUrl, String email, String displayName}) async {
    if (_user == null) {
      await {
        _user = new User._(
            photoUrl: photoUrl, email: email, displayName: displayName)
      };
    }
    return User._user;
  }

  static Future<User> signIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = new GoogleSignIn();

    GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _googleSignInAuthentication =
        await _googleSignInAccount.authentication;
    AuthCredential _credential = GoogleAuthProvider.getCredential(
      accessToken: _googleSignInAuthentication.accessToken,
      idToken: _googleSignInAuthentication.idToken,
    );

    FirebaseUser tempUser =
        (await _auth.signInWithCredential(_credential)).user;

    User user = (await User._getInstance(
      photoUrl: tempUser.photoUrl,
      email: tempUser.email,
      displayName: tempUser.displayName,
    ));
    print("ASASASAS "+tempUser.displayName + "\n");
    return user;
  }

  static User get getInstance {
    return User._user;
  }

  set setPassword(String password){
    User._user._password = password;
  }

  String get getPhotoUrl {
    return User._user._photoUrl;
  }

  String get getEmail {
    return User._user._email;
  }

  String get getDisplayName {
    return User._user._displayName;
  }

  String get getPassword {
    return User._user._password;
  }


}
