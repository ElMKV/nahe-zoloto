import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/domain/router/route_impl.dart';
import 'package:nashe_zoloto/futures/core_widgets/custom_button.dart';
import 'package:nashe_zoloto/pages/auth/bloc/auth_bloc.dart';
import 'package:nashe_zoloto/pages/home/home/home.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.pageState.errMsg)));
            } else if (state is AuthNav) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator(
                color: HexColor(AppConstants.hexColor),
              ));
            }
            return Padding(
              padding: const EdgeInsets.only(top: 23.0, left: 18, right: 18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("assets/avatar.png")),
                    const Text(
                      S.enter,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      S.hellow_title,
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          suffixIcon: SvgPicture.asset(
                            fit: BoxFit.scaleDown,
                            'assets/user.svg',
                          ),
                          hoverColor: Colors.black,
                          border: const OutlineInputBorder(),
                          hintText: S.login_edit_text,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: controllerPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: SvgPicture.asset(
                            fit: BoxFit.scaleDown,
                            'assets/eye_off.svg',
                          ),
                          hoverColor: Colors.black,
                          border: const OutlineInputBorder(),
                          hintText: S.password_edit_text,
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(S.checkbox_remember_me),
                      value: true,

                      side: const BorderSide(
                        color: Colors.black, //your desire colour here
                        width: 1.5,
                      ),
                      onChanged: (newValue) {
                        setState(() {});
                      },
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    SizedBox(
                      height: 41,
                    ),
                    Center(
                        child: CustomButton(
                      onTap: () => {
                        context.read<AuthBloc>().add(AuthLogin(
                            login: controller.value.text,
                            pass: controllerPass.value.text)),
                      },
                      text: S.enter,
                      bold: true,
                      width: 380,
                      height: 50,
                      fontSize: 16,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child: Text(S.forgot_password)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
