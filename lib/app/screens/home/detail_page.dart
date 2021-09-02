import 'package:flutter/material.dart';
import 'package:gs_two/app/core/models/image_model.dart';
import 'package:gs_two/app/core/models/name.dart';
import 'package:gs_two/app/core/models/users.dart';
import 'package:gs_two/app/shared/widgets/card_detail_widget.dart';

class DetailPage extends StatelessWidget {
  final Users users;

  DetailPage(this.users);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário'),
        centerTitle: true,
      ),
      body: CardDetailWidget(
        imageUrl: users.image ?? ImageModel(),
        name: users.name ?? Name(),
        email: users.email ?? '',
        gender: users.gender == 'female' ? 'Feminino' : 'Maculino',
      ),
    );
  }
}
