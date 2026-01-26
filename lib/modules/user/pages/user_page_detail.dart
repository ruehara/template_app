import 'package:flutter/material.dart';
import 'package:template_app/localization/l10n.dart';
import '../model/user_model.dart';

class UserDetail extends StatelessWidget {
  final UserModel object;
  const UserDetail({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: List.empty(),
        title: Text(context.l10n.detail_title),
      ),
      body: Column(
        children: [
          Center(
            child: Hero(
              tag: object.id,
              child: Image.network(object.profilePicture),
            ),
          ),
        ],
      ),
    );
  }
}
