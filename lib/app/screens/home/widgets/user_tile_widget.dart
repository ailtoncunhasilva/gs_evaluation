import 'package:flutter/material.dart';
import 'package:gs_two/app/core/models/image_model.dart';
import 'package:gs_two/app/core/models/name.dart';
import 'package:gs_two/app/core/models/users.dart';
import 'package:gs_two/app/screens/home/detail_page.dart';
import 'package:gs_two/app/shared/widgets/card_users_widget.dart';

class UserTileWidget extends StatelessWidget {
  final Users users;

  UserTileWidget(this.users);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(users)),
        );
      },
      child: CardUsersWidget(
        urlImage: users.image ?? ImageModel(),
        name: users.name ?? Name(),
        email: users.email ?? '',
        //gender: users.gender ?? '',
      ),
    );
  }
}
