import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yatak_kapasite_analizi/constants/color_constant.dart';
import 'package:yatak_kapasite_analizi/view_models/register/register_view_model.dart';
import 'package:yatak_kapasite_analizi/views/login/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = RegisterViewModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28.0, bottom: 28.0),
                  child: Image.asset("lib/assets/images/logo.jpeg", width: 150),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4, bottom: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Kayıt Ol",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                getFormField(false, "Ad", false, _nameController, null, null),
                getFormField(
                    false, "Soyad", false, _surnameController, null, null),
                getFormField(
                    false, "E-mail", false, _emailController, null, null),
                getFormField(
                    false, "Şifre", true, _passwordController, 6, null),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0, left: 24),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(CupertinoPageRoute(
                            builder: (context) => const LoginView(),
                          ));
                        },
                        child: const Text(
                          "Zaten kayıt oldunuz mu? Giriş yapın.",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () async {
                      String response = await _viewModel.register(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text,
                          _surnameController.text);
                      final snackBar = SnackBar(
                        content: Text(response),
                        action: SnackBarAction(
                          label: 'Tamam',
                          onPressed: () {},
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: getButton("Kayıt Ol", 0.05, 1, 24, 15))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getFormField(bool callbackFunc, String label, bool obscureText,
      TextEditingController? controller, double? paddingBottom, IconData? icon,
      {bool? isReadOnly, double? fontSize, bool? isDropDown}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              label,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 24, right: 24, bottom: paddingBottom ?? 10, top: 10),
          child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0XFFF0EEED)),
              child: TextFormField(
                onTap: () {},
                textAlign: TextAlign.left,
                controller: controller,
                enableSuggestions: false,
                textAlignVertical: TextAlignVertical.center,
                obscureText: obscureText,
                autocorrect: false,
                readOnly: isReadOnly ?? false,
                autofocus: false,
                style: TextStyle(
                    decorationThickness: 0,
                    fontSize: fontSize ?? 13,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.transparent),
                cursorColor: Colors.grey[600],
                decoration: InputDecoration(
                    prefixIcon: icon != null ? Icon(icon) : null,
                    helperStyle:
                        const TextStyle(decoration: TextDecoration.none),
                    errorStyle:
                        const TextStyle(decoration: TextDecoration.none),
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    border: InputBorder.none,
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 0)),
              )),
        )
      ],
    );
  }

  Widget getButton(
      String text, double height, double width, double padding, double fontsize,
      {Color? buttonColor}) {
    return Padding(
      padding: EdgeInsets.only(top: padding, left: padding, right: padding),
      child: Container(
          height: MediaQuery.of(context).size.height * height,
          width: MediaQuery.of(context).size.width * width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor ?? Color.fromARGB(255, 129, 210, 180),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: fontsize, color: Colors.black87),
          )),
    );
  }

  // Future<void> _getFromGallery() async {
  //   XFile? pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //       _ppController.text = "Fotoğraf seçildi.";
  //     });
  //   }
  // }

}
