import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do_app/services/bloc/cubit.dart';
import 'package:flutter_to_do_app/services/bloc/states.dart';
import 'package:flutter_to_do_app/services/notifications/notifications_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                appCubit.changeModeTheme();
                NotifyHelper().showNotification(
                  title: 'Theme Changed',
                  body: appCubit.isDark == true
                      ? 'Activated Dark Theme'
                      : 'Activated Light Theme',
                );
                NotifyHelper().scheduleNotification();
              },
              icon: Icon(
                appCubit.isDark ? Icons.sunny : Icons.nightlight_round,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/606239.jpg',
                  ),
                ),
              ),
            ],
          ),
          body: Row(
            children: [
              Column(
                children: [
                  Text(
                    '${DateTime.now()}',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
