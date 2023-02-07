import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final googleSignIn = GoogleSignIn();
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<AuthWatcherBloc>()
          .add(const AuthWatcherEvent.check()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthWatcherBloc, AuthWatcherState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            authenticated: (_) {
              return goNextRoute(HOME);
            },
            authInFailure: (_) {
              return goNextRoute(ON_BOARDING);
            },
            notAuthenticated: (value) {
              return goNextRoute(ON_BOARDING);
            },
          );
        },
        child: Center(
          child: SvgPicture.asset(
            Assets.logo,
            height: 100,
          ),
        ),
      ),
    );
  }

  Future<void> goNextRoute(String path) async {
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        path,
        (Route<dynamic> route) => false,
      ),
    );
  }
}
