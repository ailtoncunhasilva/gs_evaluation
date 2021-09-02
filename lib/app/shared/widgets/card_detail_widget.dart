import 'package:flutter/material.dart';
import 'package:gs_two/app/core/const.dart';
import 'package:gs_two/app/core/models/image_model.dart';
import 'package:gs_two/app/core/models/name.dart';
import 'package:gs_two/app/shared/widgets/style_detail_widget.dart';

class CardDetailWidget extends StatelessWidget {
  final ImageModel imageUrl;
  final Name name;
  final String email;
  final String gender;

  CardDetailWidget({
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: kSpacing, vertical: kSpacing),
      shadowColor: Colors.black.withOpacity(.16),
      child: Column(
        children: [
          Center(
            child: Container(
              height: 400,
              width: double.maxFinite,
              child: Image.network(imageUrl.large ?? '', fit: BoxFit.cover),
            ),
          ),
          TextStyleDetailWidget(
            listedText: 'Nome: ',
            text: '${name.title ?? ''}' +
                '.' +
                ' ${name.firstName ?? ''}' +
                ' ${name.lastName ?? ''}',
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
          Wrap(
            children: [
              TextStyleDetailWidget(listedText: 'E-mail: ', text: email),
            ],
          ),
          TextStyleDetailWidget(
            listedText: 'Gênero: ',
            text: gender,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}
