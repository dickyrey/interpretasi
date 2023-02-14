import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/presentation/bloc/localization/localization_watcher_bloc.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() => context
    //     .read<LocalizationWatcherBloc>()
    //     .add(LocalizationWatcherEvent.init()));
  }

  String language(String val) {
    switch (val) {
      case 'id':
        return 'Bahasa Indonesia';
      case 'en':
        return 'English';
      default:
        return 'Bahasa Indonesia';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<LocalizationWatcherBloc, LocalizationWatcherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _appBar(context),
          body: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Const.radius),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Const.space15,
                  ),
                  child: Column(
                    children: state.supportedLocales.map((locale) {
                      return RadioListTile(
                        value: locale,
                        contentPadding: EdgeInsets.zero,
                        activeColor: theme.primaryColor,
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                language(locale.languageCode),
                                style: theme.textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                        groupValue: state.selectedLocale,
                        onChanged: (dynamic value) {
                          context
                              .read<LocalizationWatcherBloc>()
                              .add(LocalizationWatcherEvent.select(locale));
                          // setState(() {
                          //   _selectedLocale = locale;
                          //   _locale.setLocale(locale);
                          // });
                        },
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      elevation: .5,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
      title: Text(
        lang.change_language,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
