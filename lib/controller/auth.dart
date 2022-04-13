import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var _verificationID;

  //sign with number

  Future<void> _verifyNumber(String countryCode, String phoneNumber) async {
    var mobileToSend = phoneNumber;
    final PhoneCodeSent smsOPTSent =
        (String verificationID, [int? forceCodeResend]) {
      this._verificationID = verificationID;
    };
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: mobileToSend,
          verificationCompleted: (PhoneAuthCredential credential) {
            print(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.message);
          },
          codeSent: smsOPTSent,
          codeAutoRetrievalTimeout: (String verificationId) {
            this._verificationID = verificationId;
          });
    } catch (e) {
      throw e;
    }
  }

  Future<void> _verifyOTP(String otp) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationID, smsCode: otp);

      final user = await _firebaseAuth.signInWithCredential(credential);
      final currentUserDetail = await _firebaseAuth.currentUser!;
      print(user);
      print(currentUserDetail.uid);
    } catch (e) {}
  }
}
