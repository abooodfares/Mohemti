import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<String> categories = ['الكل', 'العمل', 'الشخصية', 'الصحة', 'الترفيه'];
  String text = ' الكل';


  void changeCategory(String newCategory) {
    text = newCategory;
    emit(ChangeCategory());
  }
}
