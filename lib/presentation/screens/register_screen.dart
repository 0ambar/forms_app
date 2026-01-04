import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      )
      
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              
              _RegisterForm(),

              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {

    // This widgets rebuilds when some current change is made
    final registerCubit = context.watch<RegisterCubit>();

    final Username username = registerCubit.state.username;
    final Email email = registerCubit.state.email;
    final Password password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            // hint: 'Jhon Robinson',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage
          ),
          const SizedBox(height: 10),

          CustomTextFormField(
            label: 'email',
            // hint: 'jhon@email.com',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage
          ),
          const SizedBox(height: 10),
          
          CustomTextFormField(
            label: 'password',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),

          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            }, 
            label: const Text('Save user'),
          ),
        ],
      )
    );
  }
}