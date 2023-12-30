import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/todocubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'note_state.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('To Do App',style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) =>
              BlocConsumer<ToDoListCubit,NoteState>(
                listener: (context,state){

                },
                builder: (context,state)
                {
                  var cubit=ToDoListCubit.get(context);
                  return AlertDialog(
                    backgroundColor: Colors.black,
                    contentPadding: EdgeInsets.all(0),
                    content: Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.orange)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text('Add Task',style: TextStyle(color: Colors.orange,fontSize: 20),),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: cubit.titleController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.orange),),
                                hintText: 'Task',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: cubit.dateController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.orange),),
                                hintText: 'Date',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              style: TextStyle(color: Colors.white),
                              onTap:() {
                                showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2025)).then((value){
                                    cubit.dateController.text="${value?.day}/${value?.month}/${value?.year}";
                                });
                              },
                              keyboardType:TextInputType.none,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: cubit.timeController ,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.orange),),
                                  hintText: 'Time',
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              style: TextStyle(color: Colors.white),
                              keyboardType:TextInputType.none,
                              onTap:() {
                                showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                                  cubit.timeController.text="${value?.hour}:${value?.minute}";

                                });;
                              },
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              width: double.infinity,
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                    onPressed: () => cubit.addToDo(), child: Text('Add Task',style: TextStyle(color: Colors.white),)
                                ),
                            )

                          ],
                        ),
                      ),
                    ),
                  );
                },
          )
          );
        },
        backgroundColor: Colors.orange,
        child: Icon(CupertinoIcons.add,color: Colors.white,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      body: BlocConsumer<ToDoListCubit,NoteState>(
        listener: (context,state){

        },
          builder:(context,state) {
          var cubit=ToDoListCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.count(crossAxisCount: 1,
                childAspectRatio: 16/5,
                mainAxisSpacing: 20,
                children: List.generate(cubit.todolist.length, (index) => Container(
                  width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.orange)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cubit.todolist[index].title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                Text(cubit.todolist[index].date,style: TextStyle(color: Colors.grey,)),
                                Text(cubit.todolist[index].time,style: TextStyle(color: Colors.grey,)),
                              ],
                            ),
                          ),
                         Icon(Icons.check,color: Colors.orangeAccent,)
                        ],
                      ),
                    ),
                  ),),

              ),
            );
          },
      ),
    );
  }
}
