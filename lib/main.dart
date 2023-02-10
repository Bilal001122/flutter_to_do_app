import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do_app/const/theme.dart';
import 'package:flutter_to_do_app/services/bloc/bloc_observer.dart';
import 'package:flutter_to_do_app/services/bloc/cubit.dart';
import 'package:flutter_to_do_app/services/bloc/states.dart';
import 'package:flutter_to_do_app/services/notifications/notifications_service.dart';
import 'screens/home_screen/home.dart';
import 'services/cache_helper/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  NotifyHelper().initNotifications();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(
    MyApp(
      isDark: isDark,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) {
        AppCubit cubit = AppCubit();
        cubit.changeModeTheme(fromShared: isDark);
        return cubit;
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: Themes.kLightTheme,
            darkTheme: Themes.kDarkTheme,
            themeMode:
                appCubit.isDark == true ? ThemeMode.dark : ThemeMode.light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
