import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/presentation/bloc/theme/theme_watcher_bloc.dart';

class ThemeSettingPage extends StatefulWidget {
  const ThemeSettingPage({super.key});

  @override
  State<ThemeSettingPage> createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends State<ThemeSettingPage> {
  int _selectedRadio = 0;

  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedRadio = value ?? _selectedRadio;
    });
    context.read<ThemeWatcherBloc>().add(const ThemeWatcherEvent.changeTheme());
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final state = context.read<ThemeWatcherBloc>().state;
      if (state.isThemeLight == true) {
        _selectedRadio = 0;
      } else {
        _selectedRadio = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeWatcherBloc, ThemeWatcherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _appBar(context),
          body: Column(
            children: [
              _radioButton(
                context,
                value: 0,
                label: 'Light Mode',
              ),
              _radioButton(
                context,
                value: 1,
                label: 'Dark Mode',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _radioButton(
    BuildContext context, {
    required int value,
    required String label,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.space12),
      child: InkWell(
        onTap: () {
          _handleRadioValueChanged(value);
        },
        borderRadius: BorderRadius.circular(Const.radius),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: _selectedRadio,
              onChanged: _handleRadioValueChanged,
            ),
            const SizedBox(width: Const.space12),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.titleMedium,
              ),
            ),
            const SizedBox(width: Const.margin),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          FeatherIcons.arrowLeft,
          color: theme.iconTheme.color,
        ),
      ),
      title: Text(
        'Setting Theme',
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
