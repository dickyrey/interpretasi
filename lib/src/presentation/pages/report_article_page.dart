import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/presentation/bloc/article/report_article_actor/report_article_actor_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/outlined_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';

class ReportArticlePage extends StatefulWidget {
  const ReportArticlePage({super.key, required this.article});
  final Article article;

  @override
  State<ReportArticlePage> createState() => _ReportArticlePageState();
}

class _ReportArticlePageState extends State<ReportArticlePage> {
  late TextEditingController _controller;
  int _selectedRadio = 0;

  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedRadio = value ?? _selectedRadio;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    Future.microtask(
      () => context
          .read<ReportArticleActorBloc>()
          .add(const ReportArticleActorEvent.init()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<ReportArticleActorBloc, ReportArticleActorState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          error: (state) {
            if (state.message == ExceptionMessage.internetNotConnected) {
              final snack = showSnackbar(
                context,
                type: SnackbarType.error,
                labelText: lang.something_went_wrong,
                labelButton: lang.close,
                onTap: () {},
              );
              ScaffoldMessenger.of(context).showSnackBar(snack);
            }
          },
          success: (_) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.success,
              labelText: lang.your_report_has_been_sent,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Const.margin),
                    ArticleCardWidget(
                      article: widget.article,
                      index: 0,
                      onTap: () {},
                    ),
                    const Divider(thickness: 1.2),
                    Padding(
                      padding: const EdgeInsets.all(Const.margin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.why_are_you_reporting_this_post,
                            style: theme.textTheme.labelMedium,
                          ),
                          const SizedBox(height: Const.space12),
                          Text(
                            lang.your_report_is_anonymouse_interpretasi_team_will_use_your_report_to_check_out_this_article,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Const.space15),
                    _radioButton(
                      context,
                      value: 0,
                      label: lang.i_dont_like_it,
                    ),
                    const SizedBox(height: Const.space8),
                    _radioButton(
                      context,
                      value: 1,
                      label: lang.violating_interpretation_rules,
                    ),
                    const SizedBox(height: Const.space8),
                    _radioButton(
                      context,
                      value: 2,
                      label: lang.nudity_or_sexual_activity,
                    ),
                    const SizedBox(height: Const.space8),
                    _radioButton(
                      context,
                      value: 3,
                      label: lang.false_information,
                    ),
                    const SizedBox(height: Const.space8),
                    _radioButton(
                      context,
                      value: 4,
                      label: lang.spam_commercial_or_ads,
                    ),
                    const SizedBox(height: Const.space8),
                    _radioButton(
                      context,
                      value: 5,
                      label: lang.bullying_or_harassment,
                    ),
                    const SizedBox(height: Const.space8),
                    _radioButton(context, value: 6, label: lang.other),
                    const SizedBox(height: Const.space8),
                    if (_selectedRadio == 6)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Const.margin),
                        child: TextFormFieldWidget(
                          controller: _controller,
                          hintText: lang.write_your_reason,
                          maxLength: 160,
                          maxLines: 5,
                        ),
                      )
                    else
                      const SizedBox(),
                    const SizedBox(height: Const.space25),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Const.margin),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButtonWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      label: lang.cancel,
                    ),
                  ),
                  const SizedBox(width: Const.space25),
                  Expanded(
                    child: BlocBuilder<ReportArticleActorBloc,
                        ReportArticleActorState>(
                      builder: (context, state) {
                        return state.maybeMap(
                          orElse: () {
                            return ElevatedButtonWidget(
                              onTap: () {
                                String recommendReport(int id) {
                                  switch (_selectedRadio) {
                                    case 0:
                                      return lang.i_dont_like_it;
                                    case 1:
                                      return lang
                                          .violating_interpretation_rules;
                                    case 2:
                                      return lang.nudity_or_sexual_activity;
                                    case 3:
                                      return lang.spam_commercial_or_ads;
                                    case 4:
                                      return lang.false_information;
                                    case 5:
                                      return lang.bullying_or_harassment;
                                    case 6:
                                      return _controller.text;
                                    default:
                                      return '';
                                  }
                                }

                                context.read<ReportArticleActorBloc>().add(
                                      ReportArticleActorEvent.report(
                                        id: widget.article.url,
                                        reason: recommendReport(_selectedRadio),
                                      ),
                                    );
                              },
                              label: lang.report,
                            );
                          },
                          loading: (_) {
                            return ElevatedButtonWidget(
                              onTap: () {},
                              label: lang.report,
                              isLoading: true,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
        lang.report_article,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
