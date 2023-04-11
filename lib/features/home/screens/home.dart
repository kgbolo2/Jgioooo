// Dart imports:
import 'dart:io';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:waterbus/features/account/screens/account_screen.dart';
import 'package:waterbus/features/app/bloc/bloc.dart';
import 'package:waterbus/features/chats/screens/chats_screen.dart';
import 'package:waterbus/features/home/bloc/home/home_bloc.dart';
import 'package:waterbus/features/home/screens/home_screen.dart';
import 'package:waterbus/features/notifications/screens/notifications_screen.dart';
import 'package:waterbus/features/schedule/screens/schedule_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _tabs = [
    const HomeScreen(),
    const ScheduleScreen(),
    const ChatsScreen(),
    const NotificationsScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        bottom: false,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15,
              sigmaY: 30,
            ),
            child: Container(
              height: Platform.isIOS ? 64.sp : 60.sp,
              padding: EdgeInsets.symmetric(horizontal: 10.sp).add(
                EdgeInsets.only(
                  bottom: Platform.isIOS ? 0 : 12.sp,
                  top: 10.sp,
                ),
              ),
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.8),
              alignment: Alignment.bottomCenter,
              child: Container(
                width: SizerUtil.isTablet ? 60.w : double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildItemBottomBar(
                      iconData: PhosphorIcons.house_light,
                      iconDataSelected: PhosphorIcons.house,
                      label: 'Home',
                    ),
                    _buildItemBottomBar(
                      iconData: PhosphorIcons.calendar_check_light,
                      iconDataSelected: PhosphorIcons.calendar_check,
                      label: 'Schedule',
                      index: 1,
                    ),
                    _buildItemBottomBar(
                      iconData: PhosphorIcons.chats_teardrop_light,
                      iconDataSelected: PhosphorIcons.chats_teardrop,
                      label: 'Chats',
                      index: 2,
                    ),
                    _buildItemBottomBar(
                      iconData: PhosphorIcons.bell_simple_light,
                      iconDataSelected: PhosphorIcons.bell_simple,
                      label: 'Notifications',
                      index: 3,
                    ),
                    _buildItemBottomBar(
                      iconData: PhosphorIcons.user_circle_light,
                      iconDataSelected: PhosphorIcons.user_circle,
                      label: 'Profile',
                      index: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return _tabs[state.props[0]];
        },
      ),
    );
  }

  Widget _buildItemBottomBar({
    required IconData iconData,
    required IconData iconDataSelected,
    required String label,
    int index = 0,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          AppBloc.homeBloc.add(
            OnChangeTabEvent(tabIndex: index),
          );
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final int currentIndex = state.props[0];
            return ColoredBox(
              color: Colors.transparent,
              child: Column(
                children: [
                  Icon(
                    currentIndex == index ? iconDataSelected : iconData,
                    size: 20.sp,
                    color: currentIndex == index
                        ? Theme.of(context)
                            .bottomNavigationBarTheme
                            .selectedItemColor
                        : Theme.of(context).disabledColor,
                  ),
                  SizedBox(height: 3.sp),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 8.5.sp,
                      fontWeight: currentIndex == index
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: currentIndex == index
                          ? Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedItemColor
                          : Theme.of(context).disabledColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
