import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

File? _image;
final picker = ImagePicker();

Widget bar(context) {
  return Container(
      width: 80,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.white,
      ));
}

Widget title(context) {
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 2)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 2, color: Colors.white),
          ),
          labelText: 'Title',
          labelStyle: const TextStyle(color: Colors.white),
        ),
        cursorColor: Colors.white,
      ));
}

Widget description(context) {
  return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        expands: true,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white, width: 2)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 2, color: Colors.white),
            ),
            labelText: 'Description',
            labelStyle: const TextStyle(color: Colors.white),
            alignLabelWithHint: true),
        cursorColor: Colors.white,
      ));
}

Widget deadLine(context) {
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(color: Color(0x80FFFFFF)),
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.calendar_today_sharp,
            color: Color(0x80FFFFFF),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0x80FFFFFF), width: 2)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 2, color: Color(0x80FFFFFF)),
          ),
          labelText: 'Deadline (Optional)',
          labelStyle: const TextStyle(color: Color(0x80FFFFFF)),
        ),
        cursorColor: const Color(0x80FFFFFF),
        onTap: () {
          showDatePickerPop(context);
        },
      ));
}

Widget image(context) {
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        readOnly: true,
        style: const TextStyle(color: Color(0x80FFFFFF)),
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.image,
            color: Color(0x80FFFFFF),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0x80FFFFFF), width: 2)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 2, color: Color(0x80FFFFFF)),
          ),
          labelText: 'Add Image (Optional)',
          labelStyle: const TextStyle(color: Color(0x80FFFFFF)),
        ),
        cursorColor: const Color(0x80FFFFFF),
        onTap: () {
          getImage(ImageSource.gallery);
        },
      ));
}

Widget button(context) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Colors.white),
    child: TextButton(
      onPressed: () {},
      child: const Text(
        "ADD TODO",
        style: TextStyle(color: Color(0xFFF79E89)),
      ),
    ),
  );
}

Future<void> addTodoBottomSheetModal(context, content) {
  return showModalBottomSheet<dynamic>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: const Color(0xFFF79E89),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          children: [
            bar(context),
            title(context),
            Expanded(child: description(context)),
            deadLine(context),
            image(context),
            button(context)
          ],
        ),
      );
    },
  );
}

void showDatePickerPop(context) {
  Future<DateTime?> selectedDate = showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.dark(), //다크 테마
        child: child!,
      );
    },
  );
  selectedDate.then((dateTime) {
    print(dateTime);
    return dateTime;
  });
}

Future getImage(ImageSource imageSource) async {
  final image = await picker.pickImage(source: imageSource);
  print(image?.path ?? "");
  _image = File(image!.path); // 가져온 이미지를 _image에 저장
}
