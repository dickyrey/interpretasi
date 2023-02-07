import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interpretasi/src/common/colors.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_form/user_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/widgets/elevated_button_widget.dart';
import 'package:interpretasi/src/presentation/widgets/text_form_field_widget.dart';
import 'package:interpretasi/src/utilities/snackbar.dart';
import 'package:interpretasi/src/utilities/toast.dart';

class ProfileFormPage extends StatefulWidget {
  const ProfileFormPage({super.key});

  @override
  State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final state = context.read<UserFormBloc>().state;
    _nameController = TextEditingController(text: state.name);
    _emailController = TextEditingController(text: state.email);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _appBar(context),
      body: BlocConsumer<UserFormBloc, UserFormState>(
        listener: (context, state) {
          if (state.message == ExceptionMessage.internetNotConnected) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.error,
              labelText: lang.something_went_wrong,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          } else if (state.state == RequestState.loaded) {
            context
                .read<UserWatcherBloc>()
                .add(const UserWatcherEvent.fetch());
            showToast(msg: lang.profile_updated);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: Const.space25),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: (state.imageFile == null)
                            ? CircleAvatar(
                                radius: 60,
                                backgroundColor: theme.disabledColor,
                                backgroundImage: CachedNetworkImageProvider(
                                  state.imageUrl,
                                ),
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundColor: theme.disabledColor,
                                backgroundImage: FileImage(state.imageFile!),
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: theme.colorScheme.background,
                          radius: 25,
                          child: InkWell(
                            onTap: () {
                              _openUploadImageDialog(context);
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: theme.primaryColor,
                              child: const Icon(
                                FeatherIcons.edit3,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: Const.space25),
                Text(
                  lang.share_a_little_bit_about_yourself,
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Const.space25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Const.margin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.your_full_name,
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: Const.space8),
                      TextFormFieldWidget(
                        controller: _nameController,
                        hintText: state.email,
                        prefixIcon: Icon(
                          FeatherIcons.user,
                          color: theme.primaryColor,
                          size: 20,
                        ),
                        onChanged: (v) {
                          context
                              .read<UserFormBloc>()
                              .add(UserFormEvent.name(v));
                        },
                      ),
                      const SizedBox(height: Const.space25),
                      Text(
                        lang.your_email_address,
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: Const.space8),
                      TextFormFieldWidget(
                        enabled: false,
                        controller: _emailController,
                        hintText: state.email,
                        prefixIcon: Icon(
                          FeatherIcons.mail,
                          color: theme.primaryColor,
                          size: 20,
                        ),
                        suffixIcon: const Icon(
                          FeatherIcons.check,
                          color: ColorLight.success,
                        ),
                      ),
                      const SizedBox(height: Const.space50),
                      ElevatedButtonWidget(
                        onTap: () {
                          context
                              .read<UserFormBloc>()
                              .add(const UserFormEvent.save());
                        },
                        label: lang.save_changes,
                        labelLoading: lang.saving,
                        isLoading: (state.isSubmit) ? true : false,
                      ),
                      const SizedBox(height: Const.space25),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> _openUploadImageDialog(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return showDialog<dynamic>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Const.radius),
          ),
          content: Container(
            width: 300,
            height: 200,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lang.upload_image,
                      style: theme.textTheme.headlineSmall,
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(FeatherIcons.x),
                    ),
                  ],
                ),
                const SizedBox(height: Const.space15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<UserFormBloc>().add(
                          const UserFormEvent.pickImage(
                            ImageSource.camera,
                          ),
                        );
                  },
                  child: Text(
                    '${lang.take_photo}...',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<UserFormBloc>().add(
                          const UserFormEvent.pickImage(
                            ImageSource.gallery,
                          ),
                        );
                  },
                  child: Text(
                    '${lang.choose_from_library}...',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
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
        lang.edit_profile,
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
