import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          leadingWidth: 127,
          leading: Transform.scale(
            scale: 1,
            child: IconButton(
              icon: Image.asset('assets/ic-home-logo.png'),
              onPressed: null,
            ),
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/ic-settings.png'),
              onPressed: null,
            )
          ]),
      body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("LIST OF TODO",
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 36,
                      color: Color(0xffF76C6A))),
              buildListView()
            ],
          )),
      floatingActionButton: const FloatingActionButton(
          onPressed: null,
          backgroundColor: Color(0xffF76C6A),
          child: ImageIcon(AssetImage('assets/ic-floating.png'))),
    );
  }

  Widget buildListView() {
    return Expanded(
        child: ListView.builder(
      itemCount: 20,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        if (i.isEven) {
          return buildRow(const Color(0xFFF76C6A));
        } else {
          return buildRow(const Color(0xFFF79E89));
        }
      },
    ));
  }

  Widget buildRow(backgroundColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Design Logo",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Image(image: AssetImage('assets/ic-clock.png'))
              ]),
          const SizedBox(height: 8),
          const Text(
            "Make logo for the mini project",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ],
      ),
    );
  }
}
