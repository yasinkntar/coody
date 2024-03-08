import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coody/features/auth/presentation/blocs/sign_in_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        // User user = credential.user!;
      }
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState(error: 'Account not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState(error: 'Password error'));
      } else {
        emit(LoginErrorState(
            error: 'There was a problem, try registering later'));
      }
    }
  }

  register(String name, String email, String password) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      user.updateDisplayName(name);

      // firestore
      FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
        'name': name,
        'image': null,
        'bio': null,
        'email': email,
        'phone': null,
        'Addressc': null,
      }, SetOptions(merge: true));
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState(error: 'The password is weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(error: 'An account already exists'));
      }
    } catch (e) {
      emit(RegisterErrorState(
          error: 'He configured it in the registry and tried later'));
    }
  }

  restpassword(String email) async {
    emit(RestPasswordLoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(RestPasswordSuccessState());
    } catch (e) {
      emit(RestPasswordErrorState(error: 'Account not found'));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoadingState());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      dynamic credentiala =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User user = credentiala.user!;
      user.updateDisplayName(user.displayName);
      // firestore
      FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
        'name': user.displayName,
        'image': user.photoURL,
        'email': user.email,
        'phone': user.phoneNumber,
        'bio': ''
      }, SetOptions(merge: true));
      emit(LoginGoogleSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }
  }
}
