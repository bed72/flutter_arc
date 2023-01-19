import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seller/src/domain/params/auth/sign_up_params.dart';
import 'package:seller/src/presentation/common/extensions/context_extension.dart';

import 'package:seller/src/presentation/screens/auth/signup/cubit/signup_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  final params = const SignUpParams(
    name: 'Gabriel',
    email: 'gjramos100@gmail.com',
    password: 'cicada3301',
  );

  @override
  Widget build(BuildContext context) {
    final bloc = context.locator.get<SignUpCubit>();

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SignUpCubit, SignUpState>(
          bloc: bloc,
          builder: (_, SignUpState state) {
            if (state is SignUpLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if (state is SignUpErrorState) {
              return Center(
                child: Text(state.value.message),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Sign UP'),
                  TextButton(
                    onPressed: () {
                      bloc.signUp(params);
                    },
                    child: const Text('Enter'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
