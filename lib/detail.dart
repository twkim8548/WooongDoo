import 'package:flutter/material.dart';
import 'addTodoBottomSheetModal.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        leading: const BackButton(),
        actions: [
          IconButton(onPressed: null, icon: Image.asset('assets/ic-clock.png')),
          IconButton(
              onPressed: () {
                addTodoBottomSheetModal(context, null);
              },
              icon: Image.asset('assets/ic-edit.png')
          ),
          IconButton(onPressed: null, icon: Image.asset('assets/ic-trash.png')),
        ],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: AlignmentDirectional.topStart,
              child: const Text("DESIGN LOGO",
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 26,
                      color: Color(0xff272727))),
            ),
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsets.only(top: 24),
                child: const Text(
                  "text",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 19),
              alignment: FractionalOffset.bottomCenter,
              child: const Text("Created at 1 Sept 2021",
                  style: TextStyle(fontSize: 14, color: Color(0xff272727))),
            )
          ],
        ),
      ),
    );
  }
}
