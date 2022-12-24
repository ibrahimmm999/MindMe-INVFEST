import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/auth_cubit.dart';
import 'package:src/cubit/change_image_cubit.dart';
import 'package:src/models/user_model.dart';
import 'package:src/services/user_service.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        toolbarHeight: 70,
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().updateUser(
                          UserModel(
                            id: state.user.id,
                            email: state.user.email,
                            name: state.user.name,
                            username: state.user.username,
                            bookmark_article: state.user.bookmark_article,
                            bookmark_video: state.user.bookmark_video,
                            alamat: state.user.alamat,
                            isPremium: state.user.isPremium,
                            openTime: state.user.openTime,
                            photoUrl: context.read<ChangeImageCubit>().state,
                            resume: state.user.resume,
                            role: state.user.role,
                          ),
                        );

                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.check),
                  color: white,
                );
              } else {
                return Icon(
                  Icons.check,
                  color: white,
                );
              }
            },
          )
        ],
      );
    }

    Widget inputFullName(TextEditingController fullNameController) {
      return CustomTextFormField(
        icon: Icon(
          Icons.person_rounded,
          color: primaryColor,
        ),
        hintText: 'Your Full Name',
        controller: fullNameController,
        radiusBorder: defaultRadius,
      );
    }

    Widget inputUsername(TextEditingController usernameController) {
      return CustomTextFormField(
        icon: Icon(
          Icons.radio_button_checked_rounded,
          color: primaryColor,
        ),
        hintText: 'Your Username',
        controller: usernameController,
        radiusBorder: defaultRadius,
      );
    }

    Widget inputEmail(TextEditingController emailController) {
      return CustomTextFormField(
        icon: Icon(
          Icons.email_sharp,
          color: primaryColor,
        ),
        hintText: 'Your Email',
        controller: emailController,
        radiusBorder: defaultRadius,
      );
    }

    Widget content() {
      return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthSuccess) {
          final TextEditingController fullNameController =
              TextEditingController(text: state.user.name);
          final TextEditingController usernameController =
              TextEditingController(text: state.user.username);
          final TextEditingController emailController =
              TextEditingController(text: state.user.email);
          context.read<ChangeImageCubit>().setImage(state.user.photoUrl);
          return Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: BlocBuilder<ChangeImageCubit, String>(
                    builder: (context, stateImage) {
                      return Container(
                        margin: EdgeInsets.only(top: defaultMargin),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: stateImage.isEmpty
                              ? const DecorationImage(
                                  image: AssetImage(
                                      'assets/profile_image_default.png'),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: NetworkImage(stateImage),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 16),
                    child: TextButton(
                        onPressed: () async {
                          final file = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (file != null) {
                            File filetemp = File(file.path);
                            String imagePath =
                                await UserService().uploadImage(filetemp);
                            // ignore: use_build_context_synchronously
                            context
                                .read<ChangeImageCubit>()
                                .setImage(imagePath);
                          } else {}
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius))),
                        child: Text(
                          'Edit',
                          style: whiteText.copyWith(
                              fontSize: 14, fontWeight: medium),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Full Name",
                  style: secondaryColorText.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 12,
                ),
                inputFullName(fullNameController),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Username",
                  style: secondaryColorText.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 12,
                ),
                inputUsername(usernameController),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Email Address",
                  style: secondaryColorText.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 12,
                ),
                inputEmail(emailController),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white2,
      appBar: header(),
      body: content(),
    );
  }
}
