import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: primaryColor,
              flexibleSpace: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(
                    defaultMargin,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: state.user.photoUrl.isEmpty
                              ? const DecorationImage(
                                  image: AssetImage(
                                      'assets/profile_image_default.png'),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: NetworkImage(state.user.photoUrl),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.user.name,
                              style: whiteText.copyWith(
                                fontSize: 24,
                                fontWeight: semibold,
                              ),
                            ),
                            Text(
                              state.user.username,
                              style: greyText.copyWith(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryColorText.copyWith(
                fontSize: 14,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: secondaryColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          color: white2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                'Account',
                style: secondaryColorText.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/edit-profile'),
                  child: menuItem('Edit Profile')),
              menuItem('Transaction'),
              menuItem('Help'),
              const SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: secondaryColorText.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              menuItem('Privacy & Policy'),
              menuItem('Term of Service'),
              menuItem('Rate App'),
              const SizedBox(
                height: 40,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error),
                      backgroundColor: red,
                    ));
                  } else if (state is AuthInitial) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CustomButton(
                    radiusButton: 12,
                    buttonColor: red,
                    buttonText: 'Sign Out',
                    widthButton: double.infinity,
                    heightButton: 50,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/sign-in', (route) => false);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
