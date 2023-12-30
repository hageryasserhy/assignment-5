import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/to_do_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'note_state.dart';

class ToDoListCubit extends Cubit<NoteState>
{
  ToDoListCubit(): super(NoteInitial());
  static ToDoListCubit get(context)=>BlocProvider.of(context);
  var titleController=TextEditingController();
  var dateController=TextEditingController();
  var timeController=TextEditingController();
  List<ToDoListModel> todolist=[];
  void addToDo(){
    todolist.add(ToDoListModel(title: titleController.text,date: dateController.text, time: timeController.text));
    emit(AddToDoSuccessState());
  }

}