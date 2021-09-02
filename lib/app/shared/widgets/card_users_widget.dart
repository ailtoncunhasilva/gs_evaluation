import 'package:flutter/material.dart';
import 'package:gs_two/app/core/const.dart';
import 'package:gs_two/app/core/models/image_model.dart';
import 'package:gs_two/app/core/models/name.dart';

class CardUsersWidget extends StatelessWidget {
  final ImageModel urlImage;
  final Name name;
  final String email;

  CardUsersWidget({
    required this.urlImage,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.symmetric(
            horizontal: kSpacing, vertical: kSpacing / 2),
        shadowColor: Colors.black.withOpacity(.16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: kSpacing),
              height: 120,
              width: 100,
              child: Image.network(urlImage.large ?? ''),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.firstName ?? '',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(email),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
