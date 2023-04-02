import 'package:application/services/pref_service.dart';
import 'package:application/widgets/todo_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo_model.dart';
import '../widgets/add_todo_bottom_sheet_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  late SharedPreferences prefs;
  late Future<List<TodoModel>> todos = PrefService.getTodos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          leadingWidth: 127,
          leading: Transform.scale(
            scale: 1.5,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: IconButton(
                icon: Image.asset('assets/ic-home-logo.png'),
                onPressed: null,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/ic-settings.png'),
              onPressed: null,
            )
          ]),
      body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "LIST OF TODO",
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 36,
                  color: Color(0xffF76C6A),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: todos,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return makeList(snapshot);
                    }
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.not_listed_location_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 70,
                          ),
                          Text(
                            "EMPTY",
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              color: Theme.of(context).primaryColor,
                              fontSize: 36,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffF76C6A),
          onPressed: () {
            addTodoBottomSheetModal(context, null);
          },
          child: const ImageIcon(AssetImage('assets/ic-floating.png'))),
    );
  }

  ListView makeList(AsyncSnapshot<List<TodoModel>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return const TodoCardWidget();
      },
    );
  }
}
