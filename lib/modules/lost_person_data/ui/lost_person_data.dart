import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:countries_utils/countries_utils.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class LostPersonDataScreen extends StatefulWidget {
  @override
  _LostPersonDataScreenState createState() => _LostPersonDataScreenState();
}

class _LostPersonDataScreenState extends State<LostPersonDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _genderKey = GlobalKey<FormState>();
  final _citiesKey = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();

  var personName = TextEditingController();

  var personAge = TextEditingController();
  var moreTitleDetails = TextEditingController();
  var detailBox = TextEditingController();
  var photo = [41];
  String? selectedValue;

  final List<Country> countries = Countries.all();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: TextClass(text: 'بيانات المفقود', fontSize: 25),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_sharp, color: black))),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 35, left: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //set name, age, country,...
                buildForm(),
                SizedBox(height: 20),
                //add more photo
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: TextClass(
                    textAlign: TextAlign.start,
                    text: 'اضافه صوره او اكثر',
                    fontSize: 25,
                  ),
                ),
                // add picture
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: addPicture('assets/images/osman.jpg'))
                            : Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/IMG20201116145812.jpg',
                              height: 180,
                              width: 180,
                              fit: BoxFit.cover,
                              //color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //addPicture('assets/images/osman.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: RaisedButtonClass(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) print('ok');
                      },
                      text: "نشر",
                      textColor: white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addPicture(imageUrl) {
    return Stack(alignment: Alignment.bottomRight, children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: black,
            width: 1.3,
          ),
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.asset(
            imageUrl,
            height: 180,
            width: 180,
            fit: BoxFit.cover,
            //color: Colors.white,
          ),
        ),
      ),
      Container(
        child: Container(
          height: 50,
          width: 50,
          child: InkWell(
            child: SvgPicture.asset('assets/icons/add_icon.svg'),
            onTap: () {
              print('picture pressed');
            },
          ),
        ),
      ),
    ]);
  }

   buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //name
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextClass(
                text: 'الاسم', fontSize: 25, textAlign: TextAlign.start),
          ),
          TextFormFieldClass(
            roundedRectangleBorder: 8,
            controller: personName,
            textHint: 'ادخل اسم المفقود',
            textColor: lightGrey,
            validator: (value) =>
                value!.isEmpty ? 'من فضلك ادخل اسم المفقود' : null,
          ),
          //age
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextClass(
                text: 'الفئه العمريه',
                fontSize: 25,
                textAlign: TextAlign.start),
          ),
          TextFormFieldClass(
            roundedRectangleBorder: 10,
            controller: personAge,
            textHint: 'ادخل العمر التقريبي',
            textColor: lightGrey,
            validator: (value) =>
                value!.isEmpty ? 'من فضلك ادخل العمر التقريبي' : null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5),
            child: TextClass(
                text: 'النوع', fontSize: 25, textAlign: TextAlign.start),
          ),
          //dropdownButton for Gender
          dropdownButton(
            key: _genderKey,
            hintText: TextClass(text: 'اختر النوع', textColor: lightGrey),
            validator: (value) => value == null ? "من فضلك اختر النوع" : null,
            items: ['ذكر', 'انثي', 'اخري']
                .map((label) => DropdownMenuItem(
                      child: TextClass(text: label.toString()),
                      value: label,
                    ))
                .toList(),
          ),
          //location
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5),
            child: TextClass(
                text: 'مكان الفقدان', fontSize: 25, textAlign: TextAlign.start),
          ),
          //dropdownButton for City
          dropdownButton(
            key: _citiesKey,
            hintText: TextClass(text: 'اختر المحافظه', textColor: lightGrey),
            validator: (value) =>
                value == null ? "من فضلك اختر المحافظه" : null,
            items: ['القاهره', 'الجيزه', 'اخري']
                .map((label) => DropdownMenuItem(
                      child: TextClass(text: label.toString()),
                      value: label,
                    ))
                .toList(),
          ),
          SizedBox(height: 10),
          //location details
          dropdownButton(
            key: _key,
            hintText: TextClass(text: 'اختر المنطقه', textColor: lightGrey),
            validator: (value) => value == null ? "من فضلك اختر المنطقه" : null,
            items: ['حلوان', 'دار السلام', 'اخري']
                .map((label) => DropdownMenuItem(
                      child: TextClass(text: label.toString()),
                      value: label,
                    ))
                .toList(),
          ),
          SizedBox(height: 10),
          // more title details
          TextFormFieldClass(
            roundedRectangleBorder: 10,
            controller: moreTitleDetails,
            textHint: 'ادخل باقي تفاصيل العنوان',
            textColor: lightGrey,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5),
            child: TextClass(
              text: 'التفاصيل',
              fontSize: 25,
            ),
          ),
          TextFormFieldClass(
            hintStyle: TextStyle(height: 10, color: lightGrey),
            textHint: 'ادخل المزيد من التفاصيل',
            controller: detailBox,
          ),
        ],
      ),
    );
  }

  dropdownButton(
      {required key, required hintText, required validator, required items}) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.only(right: 10.0, left: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: key,
        child: DropdownButtonFormField(
          hint: hintText,
          icon: Icon(Icons.keyboard_arrow_down_outlined, size: 30),
          validator: validator,
          dropdownColor: Colors.grey[200],
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          items: items,
        ),
      ),
    );
  }
}
