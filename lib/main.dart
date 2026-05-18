import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/meal_bloc.dart';
import 'presentation/bloc/meal_plan_bloc.dart';

import 'presentation/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<MealBloc>(
          create: (_) => MealBloc(),
        ),

        BlocProvider<MealPlanBloc>(
          create: (_) => MealPlanBloc(),
        ),
      ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
