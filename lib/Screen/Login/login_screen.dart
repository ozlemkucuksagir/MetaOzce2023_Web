import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta_ozce_0/Screen/home_screen.dart';
import 'package:meta_ozce_0/components/home_form.dart';
import 'package:meta_ozce_0/const/background.dart';

import '../../constants.dart';
import 'widgets/gradient_button.dart';
import 'widgets/login_field.dart';
import 'widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var otelKurumNumarasiController = TextEditingController();
  var otelParolasiController = TextEditingController();
  var otelKurumNumarasi = "Otel Kurum Numarası";
  var otelParolasi = "";

  bool loginIsTrue() {
    if (otelParolasi == "metaOzce2023")
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      title: "METAOZCE ADMIN",
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/signin_balls.png'),
                const Text(
                  'MetaOzce Admin Uygulamasına Hoşgeldiniz!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 50),
                // const SocialButton(
                //     iconPath: 'assets/svgs/g_logo.svg',
                //     label: 'Continue with Google'),
                const SizedBox(height: 20),
                // const SocialButton(
                //   iconPath: 'assets/svgs/f_logo.svg',
                //   label: 'Continue with Facebook',
                //   horizontalPadding: 90,
                // ),
                const SizedBox(height: 15),

                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Otel Kurum Numarası',
                  controller: otelKurumNumarasiController,
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Kurum Parolası',
                  controller: otelParolasiController,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    otelKurumNumarasi = otelKurumNumarasiController.text;
                    otelParolasi = otelParolasiController.text;
                    loginIsTrue()
                        ? Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ))
                        : Fluttertoast.showToast(
                            webPosition: "center",
                            webBgColor: " #FF0000",
                            fontSize: 20,
                            toastLength: Toast.LENGTH_LONG,
                            msg: "Hatalı Giriş",
                          );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(395, 55),
                    backgroundColor: kPrimaryColor,
                    shadowColor: kPrimaryLightColor,
                  ),
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
