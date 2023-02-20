import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/trending_article_watcher/trending_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/pages/home_page.dart';
import 'package:interpretasi/src/presentation/pages/latest_page.dart';
import 'package:interpretasi/src/presentation/pages/profile_page.dart';
import 'package:interpretasi/src/presentation/widgets/empty_data_widget.dart';
import 'package:interpretasi/src/utilities/toast.dart';

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
  late PageController _controller;
  int _selectedIndex = 0;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    _controller = PageController(initialPage: widget.index);
    super.initState();
    Future.microtask(() {
      context.read<UserWatcherBloc>().add(const UserWatcherEvent.fetch());
      context
          .read<CategoryWatcherBloc>()
          .add(const CategoryWatcherEvent.fetch());
      context
          .read<TrendingArticleWatcherBloc>()
          .add(const TrendingArticleWatcherEvent.fetch());
      context
          .read<LatestArticleWatcherBloc>()
          .add(const LatestArticleWatcherEvent.fetch());
    });
  }

  final List<Widget> _tabView = [
    const HomePage(),
    const LatestPage(),
     const EmptyDataWidget(
      illustration: Assets.notification,
      title: 'Notifikasi Kosong',
      subtitle: 'Anda belum memiliki notifikasi apapun, artikel trending dan kategori favorit akan ditampilkan disini.',
    ),
    const ProfilePage(),
  ];

  Future<bool> _willPopCallback(BuildContext context) async {
    final now = DateTime.now();
    if (_selectedIndex == 0) {
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 4)) {
        currentBackPressTime = now;
        await showToast(msg: AppLocalizations.of(context)!.press_again_to_exit);
        return Future.value(false);
      }
    } else {
      await _controller.animateToPage(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

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
      child: WillPopScope(
        onWillPop: () => _willPopCallback(context),
        child: Scaffold(
          body: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (v) => setState(() => _selectedIndex = v),
            children: _tabView,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (v) => setState(() {
              _selectedIndex = v;
              _controller.animateToPage(
                v,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            }),
            type: BottomNavigationBarType.fixed,
            iconSize: 20,
            selectedItemColor: theme.primaryColor,
            selectedIconTheme: theme.iconTheme.copyWith(
              color: theme.primaryColor,
            ),
            selectedLabelStyle: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 9,
              color: theme.textTheme.titleMedium?.color,
            ),
            unselectedLabelStyle: theme.textTheme.titleMedium?.copyWith(
              fontSize: 9,
              color: theme.textTheme.bodyLarge?.color,
            ),
            items: [
              BottomNavigationBarItem(
                icon: const Icon(FeatherIcons.home),
                label: lang.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(FeatherIcons.clock),
                label: lang.latest,
              ),
              BottomNavigationBarItem(
                icon: const Icon(FeatherIcons.bell),
                label: lang.notification,
              ),
              BottomNavigationBarItem(
                icon: const Icon(FeatherIcons.user),
                label: lang.menu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
