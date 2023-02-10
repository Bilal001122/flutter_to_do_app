import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do_app/services/bloc/states.dart';
import '../cache_helper/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeModeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppThemeChangedState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppThemeChangedState());
      });
    }
  }
}