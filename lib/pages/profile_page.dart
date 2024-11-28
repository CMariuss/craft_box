import 'package:craft_box/features/domain/entities/app_user.dart';
import 'package:craft_box/features/presentation/cubits/auth_cubit.dart';
import 'package:craft_box/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:craft_box/features/profile/presentation/cubits/profile_states.dart';
import 'package:craft_box/pages/edit_profile_page.dart';
import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_profile_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_profile_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  final String userId;

  const ProfilePage({
    super.key,
    required this.userId,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // cubits
  late final authCubit = context.read<AuthCubit>();

  // initialize profile cubit
  late final profileCubit = context.read<ProfileCubit>();

  // get current user
  late AppUser? currentUser = authCubit.currentUser;

  // on edit button pressed
  void goToEditProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfilePage(),
      ),
    );
  }

  // load the user profile on startup
  @override
  void initState() {
    super.initState();

    // load the user profile
    profileCubit.fetchUserProfile(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    // get right profile screen size
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        // loaded state
        if (state is ProfileLoaded) {
          // get the loaded user
          final loadedUser = state.profileUser;

          return ScreenAdapt(
            mobileScaffold: MobileProfilePage(
              user: loadedUser,
              onEditPressed: goToEditProfilePage,
            ),
            tabletScaffold: TabletProfilePage(
              user: loadedUser,
            ),
            desktopScaffold: DesktopProfilePage(
              user: loadedUser,
            ),
          );
        }

        // loading state
        else if (state is ProfileLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('Cannot load the profile . .'),
          );
        }
      },
    );
  }
}
