import 'package:flutter/material.dart';

import 'components/action_button.dart';
import 'components/text_input.dart';
import 'profile.dart';

class UserVerification extends StatefulWidget {
  final phone;

  const UserVerification({Key? key, this.phone}) : super(key: key);

  @override
  State<UserVerification> createState() => _UserVerificationState();
}

enum SCREENSTATE { BVN, PROFILE }

class _UserVerificationState extends State<UserVerification> {
  final _controller = TextEditingController();
  var _bvn;
  var _phone;
  var height;
  var width;

  _confirm() {
    setState(() {
      _bvn = _controller.text;
      _phone = widget.phone;
    });

    if (_bvn.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Invalid BVN"),
              content: Text("input a valid bvn number "),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("close")),
              ],
            );
          });
    } else if (_bvn != "0123456789") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Invalid BVN"),
              content: Text(
                  "$_bvn is not linked to your register mobile number $_phone "),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Retry")),
              ],
            );
          });
    } else {
      debugPrint("sucessfully verified bvn $_bvn");
      setState(() {
        currentState = SCREENSTATE.PROFILE;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  SCREENSTATE currentState = SCREENSTATE.BVN;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffD3F8FB),
        body: currentState == SCREENSTATE.BVN
            ? BVNScreen(
                controller: _controller,
                callback: _confirm,
              )
            : Profile(
                bvn: _bvn,
                phone: _phone,
              ),
      ),
    );
  }
}

class BVNScreen extends StatelessWidget {
  final controller;
  final callback;

  const BVNScreen({Key? key, this.controller, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 160),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Bank Verifaction",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.10,
                ),
              ),
              Text(
                "number",
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
          TextInput(
            controller: controller,
            label: "bvn number",
          ),
          const Spacer(),
          const Text(
            "Your Bank Verification Number must be linked to your registered phone number.",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              fontStyle: FontStyle.normal,
            ),
          ),
          const SizedBox(height: 15),
          ActionButton(
            label: "Confirm",
            callback: callback,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
