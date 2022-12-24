import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/cubit/consultant_cubit.dart';
import 'package:src/models/user_model.dart';
import 'package:src/ui/user_pages/psikolog_detail_page.dart';
import 'package:src/ui/widgets/custom_button.dart';

import '../../shared/theme.dart';

class ConsultRoomPage extends StatelessWidget {
  const ConsultRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        toolbarHeight: 70,
        backgroundColor: white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: secondaryColor,
          iconSize: 16,
        ),
        title: Text(
          'Consult Room',
          style: secondaryColorText.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      Widget consultantTile(UserModel consultant) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PsikologDetailPage(
                          consultant: consultant,
                        )));
          },
          child: Container(
            padding: EdgeInsets.all(4),
            width: 315,
            height: 110,
            margin: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Container(
                  height: 102,
                  width: 102,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: consultant.photoUrl.isEmpty
                        ? const DecorationImage(
                            image: AssetImage(
                                "assets/profile_image_default_kotak.png"),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: NetworkImage(consultant.photoUrl),
                            fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    width: 193,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          consultant.name,
                          style: secondaryColorText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: primaryColor,
                              size: 18,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              consultant.alamat,
                              style: secondaryColorText.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          consultant.openTime,
                          style: toscaText.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }

      return BlocBuilder<ConsultanCubit, ConsultantState>(
        builder: (context, state) {
          if (state is ConsultantLoading) {
            return Center(
              child: CircularProgressIndicator(color: secondaryColor),
            );
          } else if (state is ConsultantSuccess) {
            if (state.consultants.isEmpty) {
              return Center(
                child: Text(
                  'Kamu Belum Memiliki Transaksi',
                  style: secondaryColorText.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
              );
            } else {
              return ListView(
                padding: EdgeInsets.only(
                    right: defaultMargin,
                    left: defaultMargin,
                    top: defaultMargin),
                children:
                    state.consultants.map((e) => consultantTile(e)).toList(),
              );
            }
          } else {
            return const Center(child: Text('FOUND SOME ERRORS!'));
          }
        },
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: white2,
      body: content(),
    );
  }
}
