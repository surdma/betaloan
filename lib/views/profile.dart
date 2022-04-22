import 'package:beta_loan/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/action_button.dart';

class Profile extends StatefulWidget {
  final bvn, phone;
  Profile({Key? key, this.bvn, this.phone}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _controller = TextEditingController();

  var height;
  var width;

  _confirm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DashBoard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffD3F8FB),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "BetaLoan",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          height: 240,
                          width: 240,
                          child: Image.asset(
                            "assets/images/mine.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    ProfileDetail(data: widget.bvn, label: "bvn"),
                    const ProfileDetail(data: "Opeyemi", label: "firstname"),
                    const ProfileDetail(data: "Daniel", label: "middlename"),
                    const ProfileDetail(data: "Oladejo", label: "lastname"),
                    const ProfileDetail(
                        data: "22/01/1899", label: "Date of Birth"),
                    const ProfileDetail(
                        data: "Single", label: "Marital Status"),
                    const ProfileDetail(
                        data: "olasurd@yahoo.com", label: "email address"),
                    ProfileDetail(data: widget.phone, label: "Phone Number"),
                    const ProfileDetail(
                        data: "mypa area, bosso, minna, niger state",
                        label: "home address"),
                    const ProfileDetail(
                        data: "oyo state", label: "state of origin"),
                    const ProfileDetail(data: "Nigerian", label: "Nationality"),
                    const SizedBox(height: 20),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ActionButton(
                    label: "Confirm",
                    callback: _confirm,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final data;
  final label;
  const ProfileDetail({
    Key? key,
    this.data,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        initialValue: data,
        enabled: false,
        maxLength: 10,
        autofocus: true,
        autovalidateMode: AutovalidateMode.always,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          counterText: "",
          contentPadding: const EdgeInsets.only(left: 20.0),
        ),
      ),
    );
  }
}
