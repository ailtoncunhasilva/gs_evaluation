import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gs_two/app/core/const.dart';
import 'package:gs_two/app/screens/home/filter_dialog_page.dart';
import 'package:gs_two/app/screens/home/home_manager/home_page_manager.dart';
import 'package:gs_two/app/screens/home/widgets/user_tile_widget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final manager = context.read<HomePageManager>();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('GS EVALUATION'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _onFilterPage(),
            icon: Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<HomePageManager>(
              builder: (_, homePageManager, __) {
                final filterUsers = homePageManager.filterUsers;
                if (homePageManager.filterUsers.isEmpty) {
                  return Center(
                      child: CircularProgressIndicator(color: Colors.white));
                } else {
                  return LazyLoadScrollView(
                    isLoading: loading,
                    scrollOffset: 0,
                    onEndOfPage: () => manager.getUsers(),
                    child: ListView(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: filterUsers.length,
                          itemBuilder: (context, index) {
                            return UserTileWidget(
                                filterUsers[index]);
                          },
                        ),
                        loading
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.only(
                                    top: kSpacing, bottom: kSpacing),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _onFilterPage() async {
    final gender =
        await showDialog(context: context, builder: (_) => FilterDialogPage());

    if (gender != null) {
      context.read<HomePageManager>().gender = gender;
    }
  }
}
