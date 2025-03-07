

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mohemti/core/models/taskmodel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<String> categories = ['الكل', 'العمل', 'الشخصية', 'الصحة', 'الترفيه'];
  String text = 'الكل';

  List<Taskmodel> tasks = [];
  void addTask(Taskmodel task) {
    tasks.add(task);
    emit(AddTask());
  }

  void updateTask(Taskmodel task, int index) {
    tasks[index] = task;
    emit(UpdateTask());
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    emit(DeleteTask());
  }

  void changeCategory(String newCategory) {
    text = newCategory;
    emit(ChangeCategory());
  }

  @override
  void onChange(Change<HomeState> change) {
    print(change);
    super.onChange(change);
  }
}
