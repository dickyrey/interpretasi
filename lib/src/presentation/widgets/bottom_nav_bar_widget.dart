import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
    this.index = 0,
  });

  final int index;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: widget.index);
    super.initState();
    Future.microtask(() {
      context.read<UserWatcherBloc>().add(const UserWatcherEvent.fetchUser());
      context
          .read<CategoryWatcherBloc>()
          .add(const CategoryWatcherEvent.fetchCategories());
    });
  }

  final List<Widget> _tabView = [
    const Center(child: CircularProgressIndicator()),
    const Center(child: Text('3')),
    const Center(child: Text('3')),
    const Center(child: Text('4')),
  ];

  List<PersistentBottomNavBarItem> _listNavItem(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(FeatherIcons.home),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: theme.disabledColor,
        textStyle: theme.textTheme.bodySmall,
        iconSize: 20,
        title: lang.home,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FeatherIcons.clock),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: theme.disabledColor,
        iconSize: 20,
        textStyle: theme.textTheme.bodySmall,
        title: lang.latest,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FeatherIcons.bell),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: theme.disabledColor,
        textStyle: theme.textTheme.bodySmall,
        iconSize: 20,
        title: lang.notification,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FeatherIcons.menu),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: theme.disabledColor,
        iconSize: 20,
        textStyle: theme.textTheme.bodySmall,
        title: lang.menu,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthWatcherBloc, AuthWatcherState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          notAuthenticated: (_) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LOGIN,
              (Route<dynamic> route) => false,
            );
          },
        );
      },
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _tabView,
          items: _listNavItem(context),
          navBarStyle: NavBarStyle.style14,
        ),
      ),
    );
  }
}
