import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/to_do_list.dart';
import 'package:flutter_assignment_5/todocubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoListCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ToDoList(),
      
      ),
    );
  }
}