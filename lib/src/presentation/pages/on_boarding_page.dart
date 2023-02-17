// ignore_for_file: depend_on_referenced_packages

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/domain/entities/boarding.dart';
import 'package:interpretasi/src/presentation/bloc/boarding/boarding_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/outlined_button_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _controller = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<BoardingWatcherBloc>()
          .add(const BoardingWatcherEvent.fetch()),
    );
  }

  // This is CORE of On Boarding Page

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _appBar(theme, lang),
      body: BlocBuilder<BoardingWatcherBloc, BoardingWatcherState>(
        builder: (context, state) {
          return state.map(
            initial: (_) {
              return const SizedBox();
            },
            loading: (_) {
              return const SizedBox();
            },
            error: (_) {
              return const SizedBox();
            },
            loaded: (state) {
              return _mainPage(state.boardingList);
            },
          );
        },
      ),
    );
  }

  // Main Page if Boarding data successfull fetch from database

  Column _mainPage(List<Boarding> boardingList) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Column(
      children: [
        const SizedBox(height: 50),

        // Child on Expanded Below Contains
        // Main Page such as Illustration, Title and Subtitle
        Expanded(
          flex: 9,
          child: PageView.builder(
            controller: _controller,
            itemCount: boardingList.length,
            onPageChanged: (v) {
              setState(() {
                _selectedIndex = v;
              });
            },
            itemBuilder: (context, index) {
              final data = boardingList[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Const.margin,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: SvgPicture.asset(
                        data.image,
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox()),
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineLarge,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      data.subtitle,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Expanded(child: SizedBox()),

        // Child on this Expanded contains
        // DotsIndicator, Next Page Button, Register and Login Button
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Const.margin,
            ),
            child: Column(
              children: [
                DotsIndicator(
                  dotsCount: boardingList.length,
                  position: _selectedIndex.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: theme.primaryColor,
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                if (_selectedIndex == 2)
                  ElevatedButtonWidget(
                    onTap: () => Navigator.pushNamed(context, REGISTER),
                    label: lang.create_an_account,
                    color: theme.primaryColor,
                  )
                else
                  const SizedBox(),
                Expanded(flex: 2, child: Container()),
                if (_selectedIndex == 2)
                  OutlinedButtonWidget(
                    onTap: () => Navigator.pushNamed(context, LOGIN),
                    label: lang.have_an_account,
                  )
                else
                  OutlinedButtonWidget(
                    onTap: () {
                      // This method Will navigate to next page
                      // when OutlinedButton pressed

                      _controller.animateToPage(
                        _selectedIndex + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      );
                    },
                    label: lang.next,
                  ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // AppBar from On Boarding Page contains back button, logo and Skip button

  AppBar _appBar(ThemeData theme, AppLocalizations lang) {
    return AppBar(
      backgroundColor: theme.colorScheme.background,
      elevation: 0,
      actions: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, REGISTER),
          child: Text(
            lang.skip,
            style: theme.textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
