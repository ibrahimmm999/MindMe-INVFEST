import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/detail_chat.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChat(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/example/profile_pict_example.png',
                    width: 54,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mr. Budi, S.Psi.',
                        style: secondaryColorText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Good night, This item is on Good night, This item is on',
                        style: greyText.copyWith(
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: disableText.copyWith(
                    fontSize: 10,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: disableColor.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
