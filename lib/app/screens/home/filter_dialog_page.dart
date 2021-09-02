import 'package:flutter/material.dart';
import 'package:gs_two/app/core/const.dart';
import 'package:gs_two/app/screens/home/home_manager/filter_home_page_manager.dart';
import 'package:gs_two/app/shared/widgets/card_gender_dialog_widget.dart';
import 'package:gs_two/app/shared/widgets/elevated_round_button_widget.dart';
import 'package:provider/provider.dart';

class FilterDialogPage extends StatefulWidget {
  @override
  _FilterDialogPageState createState() => _FilterDialogPageState();
}

class _FilterDialogPageState extends State<FilterDialogPage> {
  String itemSelected = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: kSpacing,
          right: kSpacing,
          top: kSpacing,
          child: CardGenderDialogWidget(
            textWidget: Text(
              'Selecione o gênero:',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            dropWidget: Padding(
              padding: const EdgeInsets.symmetric(vertical: kSpacing),
              child: _buildDropdownGender(),
            ),
            buttonWidget: _buildFilterButton(),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownGender() {
    return Consumer<FilterHomePageManager>(
      builder: (_, filterHomePageManager, __) {
        return DropdownButtonFormField(
          items: filterHomePageManager.genderList,
          value: filterHomePageManager.itemSelected,
          onChanged: (value) {
            filterHomePageManager.itemSelected = value as String;
          },
        );
      },
    );
  }

  Widget _buildFilterButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: ElevatedRoundButton(
        labelText: 'Filtrar',
        onPressed: () {
          Navigator.of(context).pop(context.read<FilterHomePageManager>().itemSelected);
        },
      ),
    );
  }
}
