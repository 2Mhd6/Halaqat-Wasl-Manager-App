import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final charityNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
