import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mohemti/core/models/taskmodel.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<Taskmodel> {
  TaskCubit() : super(Taskmodel(id: '2',
      title: 'test',
      time: TimeOfDay.now(),
      date: DateTime.now(),
      category: 'test',
      dayrepeat: 'test',
      ranking: 0,
      reminder: 0


  ));

  void changeCategory(String newCategory) {
    emit(Taskmodel(
        id: state.id,
        title: state.title,
        time: state.time,
        date: state.date,
        category: newCategory,
        dayrepeat: state.dayrepeat,
        ranking: state.ranking));
  }

  void changeRanking(int newRanking) {
    emit(Taskmodel(
        id: state.id,
        title: state.title,
        time: state.time,
        date: state.date,
        category: state.category,
        dayrepeat: state.dayrepeat,
        ranking: newRanking));
  }

  void changeDayrepeat(String newDayrepeat) {
    emit(Taskmodel(
        id: state.id,
        title: state.title,
        time: state.time,
        date: state.date,
        category: state.category,
        dayrepeat: newDayrepeat,
        ranking: state.ranking));
  }
  void changeTitle(String newTitle) {
    emit(Taskmodel(
        id: state.id,
        title: newTitle,
        time: state.time,
        date: state.date,
        category: state.category,
        dayrepeat: state.dayrepeat,
        ranking: state.ranking));
  }
  void changeTime(TimeOfDay newTime) {
    emit(Taskmodel(
        id: state.id,
        title: state.title,
        time: newTime,
        date: state.date,
        category: state.category,
        dayrepeat: state.dayrepeat,
        ranking: state.ranking));
  }
  void changeDate(DateTime newDate) {
    emit(Taskmodel(
        id: state.id,
        title: state.title,
        time: state.time,
        date: newDate,
        category: state.category,
        dayrepeat: state.dayrepeat,
        ranking: state.ranking));
  }
  void changeReminder(int newReminder) {
    emit(Taskmodel(
        id: state.id,
        title: state.title,
        time: state.time,
        date: state.date,
        category: state.category,
        dayrepeat: state.dayrepeat,
        ranking: state.ranking,
        reminder: newReminder));
  }
  

  
}



class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase cubit) {
    super.onCreate(cubit);
    print('${cubit.runtimeType} has been created');
  }

  @override
  void onChange(BlocBase cubit, Change change) {
    super.onChange(cubit, change);
    print('${cubit.runtimeType} state changed: ${change.currentState} -> ${change.nextState}');
  }

  @override
  void onClose(BlocBase cubit) {
    super.onClose(cubit);
    print('${cubit.runtimeType} has been closed');
  }
}
