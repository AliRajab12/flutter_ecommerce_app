import 'package:flutter/material.dart';
import 'package:store/presentation/widgets/custom_app_bar.dart';
import 'package:store/Utilities/size_config.dart';
import 'components/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      appBar: CustomAppBar(title: "My Profile",),
      body:  ProfileContent(),
    );
  }
}
