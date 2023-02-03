import 'package:flutter/material.dart';

import 'package:seller/src/data/models/auth/sign_up_params_model.dart';
import 'package:seller/src/presentation/common/extensions/context_extension.dart';

import 'package:seller/src/presentation/screens/auth/signup/cubit/signup_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  final params = const SignUpParamsModel(
    name: 'Gabriel',
    email: 'gjramos011@gmail.com',
    password: 'cicada3301',
  );

  @override
  Widget build(BuildContext context) {
    final bloc = context.locator.get<SignUpCubit>();

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: bloc,
          builder: (_, SignUpState state, __) {
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

            if (state is SignUpSuccessState) {
              return Center(
                child: Text(state.value.refreshToken),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Sign UP'),
                  const SizedBox(height: 10),
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

    // return Scaffold(
    //   body: SafeArea(
    //     child: BlocBuilder<SignUpCubit, SignUpState>(
    //       bloc: bloc,
    //       builder: (_, SignUpState state) {
    //         if (state is SignUpLoadingState) {
    //           return const Center(
    //             child: CircularProgressIndicator.adaptive(),
    //           );
    //         }

    //         if (state is SignUpErrorState) {
    //           return Center(
    //             child: Text(state.value.message),
    //           );
    //         }

    //         if (state is SignUpSuccessState) {
    //           return Center(
    //             child: Text(state.value.refreshToken),
    //           );
    //         }

    //         return Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               const Text('Sign UP'),
    //               const SizedBox(height: 10),
    //               TextButton(
    //                 onPressed: () {
    //                   bloc.signUp(params);
    //                 },
    //                 child: const Text('Enter'),
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
