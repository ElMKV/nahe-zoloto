import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nashe_zoloto/domain/router/route_impl.dart';


import 'bloc/auth_bloc.dart';

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
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.pageState.errMsg)));
            } else if (state is AuthNav) {
              // context.read<RouteImpl>().push(Routes.main, args: state.pageState.auth);
            }
          },
          builder: (context, state) {
            if(state is AuthLoading){
              return Center(child: CircularProgressIndicator());
            }
            return Text('auth');
          },
        ),
      ),
    );
  }
}
