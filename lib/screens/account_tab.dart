import 'package:flutter/material.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';

class AccountTab extends StatelessWidget with ColorPallet {
  AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        width: screenWidth(context),
        color: white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Text(
          'Your Account',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.person),
            ),
            const SizedBox(width: 40),
            Text(
              'Rafatul Islam',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(child: Container()),
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
            const SizedBox(width: 10),
          ],
        ),
      ),
    ]);
  }
}
