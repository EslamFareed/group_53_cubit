import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubits/counter/counter_cubit.dart';
import 'package:flutter_application_4/cubits/main/main_cubit.dart';
import 'package:flutter_application_4/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => MainCubit()),
        // BlocProvider(create: (context)=>CounterCubit()),
        // BlocProvider(create: (context)=>CounterCubit()),
        // BlocProvider(create: (context)=>CounterCubit()),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            themeAnimationDuration: Duration(seconds: 1),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            themeMode: MainCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
          );
        },
      ),
    );

    // return BlocProvider(
    //   create: (context) => CounterCubit(),
    // child: MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: HomeScreen(),
    // ),
    // );
  }
}
// BLoc provier
// Multi Bloc Provider