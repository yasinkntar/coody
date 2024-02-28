import 'package:coody/core/models/prodctecart.dart';
import 'package:coody/core/services/local_storage.dart';
import 'package:coody/core/utils/colors.dart';
import 'package:coody/features/auth/presentation/blocs/sign_in_cubit.dart';
import 'package:coody/features/cart/bloc/cart_cubit.dart';
import 'package:coody/features/checkout/bloc/checkout_cubit.dart';
import 'package:coody/features/profile/bloc/profile_cubit.dart';
import 'package:coody/features/splassch_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBVQjLm_eniH4zi5f9Jo-AJeVOBhqqFU0s',
          appId: 'com.kimit.foody',
          messagingSenderId: '968110009539',
          projectId: 'conloe'));
  await Hive.initFlutter();
  Hive.registerAdapter(ProdcteAppAdapter());
  Hive.openBox<ProdcteApp>(CartLocal.tablecart);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (BuildContext context) => ProfileCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit(),
        ),
        BlocProvider<CheckoutCubit>(
          create: (BuildContext context) => CheckoutCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: AppColors.colorprimer,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white, elevation: 0),
              // scaffoldBackgroundColor: const Color(0xff121223)
              snackBarTheme:
                  const SnackBarThemeData(backgroundColor: Colors.red),
              inputDecorationTheme: InputDecorationTheme(
                fillColor: const Color(0xfff0f5fa),
                alignLabelWithHint: true,

                // contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                hintStyle: GoogleFonts.sen().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff31343d)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xfff0f5fa),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfff0f5fa)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xfff0f5fa),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xfff0f5fa),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              useMaterial3: false),
          home: const SplasschScreeen()),
    );
  }
}
