import 'package:beta_loan/views/user_verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

import '/views/components/action_button.dart';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

enum SCREENSTATE { loginScreen, otpScreen }

class _LoginState extends State<Login> {
  final _phoneNumber = TextEditingController();
  final _text_one = TextEditingController();
  final _text_two = TextEditingController();
  final _text_three = TextEditingController();
  final _text_four = TextEditingController();
  final _text_five = TextEditingController();
  final _text_six = TextEditingController();

  var _verificationID;
  var _otpCode;

  var _countryCode = "+234";
  SCREENSTATE currentScreen = SCREENSTATE.loginScreen;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool focus = false;
  bool _showLoading = false;

  @override
  void dispose() {
    _phoneNumber.dispose();
    _text_one.dispose();
    _text_two.dispose();
    _text_three.dispose();
    _text_four.dispose();
    _text_five.dispose();
    _text_six.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF77BDD7),
              Color(0xFFA7EBF4),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: _showLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : currentScreen == SCREENSTATE.loginScreen
                  ? loginScreen()
                  : otpScreen(),
        ),
      ),
    );
  }

  loginScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 184),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Enter your",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.10,
              ),
            ),
            Text(
              "mobile number",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 45),
        IntlPhoneField(
          controller: _phoneNumber,
          initialCountryCode: "NG",
          keyboardType: TextInputType.phone,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.done_outline_rounded,
              size: 10,
            ),
            labelText: "Mobile Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          ),
        ),
        const Spacer(),
        const Text(
          "Make sure your mobile number is connected to your bvn",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(height: 15),
        ActionButton(
          label: "Send Code",
          callback: _sendCode,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  otpScreen() {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          "OTP",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 70),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Lottie.asset("assets/splash/otp.json"),
        )),
        const SizedBox(height: 50),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            otpTextBox(
                first: true,
                last: false,
                context: context,
                controller: _text_one),
            otpTextBox(
                first: false,
                last: false,
                context: context,
                controller: _text_two),
            otpTextBox(
                first: false,
                last: false,
                context: context,
                controller: _text_three),
            otpTextBox(
                first: false,
                last: false,
                context: context,
                controller: _text_four),
            otpTextBox(
                first: false,
                last: false,
                context: context,
                controller: _text_five),
            otpTextBox(
                first: false,
                last: true,
                context: context,
                controller: _text_six),
          ],
        ),
        const Spacer(),
        Text(
          "An OTP message has been sent to 0${_phoneNumber.text}, Make sure the connected to your registered bvn details.",
          style: const TextStyle(
              fontFamily: "Poppins", fontSize: 13, fontStyle: FontStyle.normal),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {},
          child: const Text(
            "Resend Code",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ActionButton(
            label: "Verify",
            callback: () {
              setState(() {
                _otpCode = _text_one.text +
                    _text_two.text +
                    _text_three.text +
                    _text_four.text +
                    _text_five.text +
                    _text_six.text;
              });
              final _phoneAuthCredential = PhoneAuthProvider.credential(
                  verificationId: _verificationID, smsCode: _otpCode);
              _verify(_phoneAuthCredential);
            }),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  otpTextBox({first, last, context, controller}) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextFormField(
          controller: controller,
          showCursor: false,
          autofocus: true,
          maxLength: 1,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            counter: const Offstage(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.greenAccent, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 25, 133, 81), width: 2),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            } else if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }

  _sendCode() async {
    setState(() {
      _showLoading = true;
    });
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: _countryCode + _phoneNumber.text,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          setState(() {
            _showLoading = false;
          });
        },
        verificationFailed: (FirebaseAuthException error) async {
          debugPrint(error.message);
        },
        codeSent: (String verificationId, int? resendToken) async {
          setState(() {
            _showLoading = false;
            currentScreen = SCREENSTATE.otpScreen;
            _verificationID = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) async {});
  }

  _verify(PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      _showLoading = true;
    });

    try {
      final _authCredential =
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      setState(() {
        _showLoading = false;
      });
      if (_authCredential.user != null) {
        debugPrint("Logged in successfull");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => UserVerification(
                  phone: _phoneNumber.text,
                )));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _showLoading = false;
      });
      debugPrint(e.message);
    }
  }
}
