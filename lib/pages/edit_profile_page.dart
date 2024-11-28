import 'package:craft_box/components/circular_progress.dart';
import 'package:craft_box/features/profile/domain/entities/profile_user.dart';
import 'package:craft_box/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:craft_box/features/profile/presentation/cubits/profile_states.dart';
import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_edit_profile_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_edit_profile_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileUser user;

  const EditProfilePage({
    super.key,
    required this.user,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final bioTextController = TextEditingController();

  // on save button pressed
  void updateUserProfile() async {
    // profile cubit
    final profileCubit = context.read<ProfileCubit>();

    // update profile bio
    profileCubit.updateProfile(
      userId: widget.user.userId,
      newBio: bioTextController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        // loading profile state
        if (state is ProfileLoading) {
          // show a circular progress indicator
          return const CircularProgress();
        }
        // show edit form page
        else {
          return ScreenAdapt(
            mobileScaffold: MobileEditProfilePage(
              controller: bioTextController,
              onSaveTap: updateUserProfile,
            ),
            tabletScaffold: const TabletEditProfilePage(),
            desktopScaffold: const DesktopEditProfilePage(),
          );
        }
      },
      listener: (context, state) {
        // if the state is ProfileLoaded then close the current page
        if (state is ProfileLoaded) {
          Navigator.pop(context);
        }
      },
    );
  }
}
