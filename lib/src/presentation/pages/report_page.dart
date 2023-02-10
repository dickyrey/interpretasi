import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/entities/author.dart';
import 'package:interpretasi/src/domain/entities/comment.dart';
import 'package:interpretasi/src/presentation/bloc/report/report_actor_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/article_card_widget.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/outlined_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';

class ReportArgument {
  ReportArgument({
    this.article,
    this.author,
    this.comment,
    required this.type,
  });

  final Article? article;
  final Author? author;
  final Comment? comment;
  final ReportType type;
}

class ReportPage extends StatefulWidget {
  const ReportPage({super.key, required this.args});
  final ReportArgument args;

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
      () => context.read<ReportActorBloc>().add(const ReportActorEvent.init()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String title(ReportType type) {
      switch (type) {
        case ReportType.article:
          return lang.why_are_you_reporting_this_post;
        case ReportType.author:
          return lang.why_are_you_reporting_this_author;
        case ReportType.comment:
          return lang.why_are_you_reporting_this_comment;
      }
    }

    String subtitle(ReportType type) {
      switch (type) {
        case ReportType.article:
          return lang
              .your_report_is_anonymouse_interpretasi_team_will_use_your_report_to_check_out_this_article;
        case ReportType.author:
          return lang
              .your_report_is_anonymouse_interpretasi_team_will_use_your_report_to_check_out_this_author;
        case ReportType.comment:
          return lang
              .your_report_is_anonymouse_interpretasi_team_will_use_your_report_to_check_out_this_comment;
      }
    }

    return BlocListener<ReportActorBloc, ReportActorState>(
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
                    if (widget.args.author != null)
                      _AuthorCardWidget(author: widget.args.author!)
                    else
                      ArticleCardWidget(
                        showIconButton: false,
                        article: widget.args.article!,
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
                            title(widget.args.type),
                            style: theme.textTheme.labelMedium,
                          ),
                          const SizedBox(height: Const.space12),
                          Text(
                            subtitle(widget.args.type),
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
                          horizontal: Const.margin,
                        ),
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
                    child: BlocBuilder<ReportActorBloc, ReportActorState>(
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

                                if (widget.args.type == ReportType.article) {
                                  context.read<ReportActorBloc>().add(
                                        ReportActorEvent.reportArticle(
                                          id: widget.args.article!.url,
                                          reason: recommendReport(
                                            _selectedRadio,
                                          ),
                                        ),
                                      );
                                } else if (widget.args.type ==
                                    ReportType.author) {
                                  context.read<ReportActorBloc>().add(
                                        ReportActorEvent.reportAuthor(
                                          id: widget.args.author!.id,
                                          reason: recommendReport(
                                            _selectedRadio,
                                          ),
                                        ),
                                      );
                                } else if (widget.args.type ==
                                    ReportType.comment) {
                                  context.read<ReportActorBloc>().add(
                                        ReportActorEvent.reportComment(
                                          url: widget.args.article!.url,
                                          commentId: widget.args.comment!.id,
                                          reason: recommendReport(
                                            _selectedRadio,
                                          ),
                                        ),
                                      );
                                }
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
        lang.report,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}

class _AuthorCardWidget extends StatelessWidget {
  const _AuthorCardWidget({required this.author});

  final Author author;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: Const.margin,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: theme.disabledColor,
            backgroundImage: CachedNetworkImageProvider(
              author.photo,
            ),
          ),
          const SizedBox(width: Const.space8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  author.name,
                  maxLines: 1,
                  style: theme.textTheme.headlineSmall,
                ),
                Text(
                  author.email,
                  maxLines: 1,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
