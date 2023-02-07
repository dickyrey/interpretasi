// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:interpretasi/src/presentation/widgets/dialog_widget.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({
//     super.key,
//     required this.showPreview,
//     required this.showPublish,
//     required this.showEdit,
//   });
//   final bool showPreview;
//   final bool showPublish;
//   final bool showEdit;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (showPreview == true)
//           TileButtonDialog(
//             onTap: () {
//               //TODO: Preview
//             },
//             icon: FeatherIcons.eye,
//             label: lang.preview,
//           )
//         else
//           const SizedBox(),
//         if (showPublish == true)
//           TileButtonDialog(
//             onTap: () {
//               Navigator.pop(context);
//               context
//                   .read<ModeratedActorBloc>()
//                   .add(ModeratedActorEvent.change(article.url));
//             },
//             icon: FeatherIcons.send,
//             label: lang.publish,
//           )
//         else
//           const SizedBox(),
//         if (showEdit == true)
//           TileButtonDialog(
//             onTap: () {
//               //TODO: Edit
//             },
//             icon: FeatherIcons.edit2,
//             label: lang.edit,
//           )
//         else
//           const SizedBox(),
//       ],
//     );
//   }
// }
