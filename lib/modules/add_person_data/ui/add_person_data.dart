import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/cubit.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/states.dart';

import 'package:lost_app/shared/components/raised_button_class.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/components/text_form_field_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class AddPersonDataScreen extends StatefulWidget {
  @override
  _AddPersonDataScreenState createState() => _AddPersonDataScreenState();
}

class _AddPersonDataScreenState extends State<AddPersonDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _genderKey = GlobalKey<FormState>();
  final _citiesKey = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();
  var personName = TextEditingController();
  var personAge = TextEditingController();
  var moreTitleDetails = TextEditingController();
  var detailBox = TextEditingController();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPersonDataCubit, PersonDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    //set name, age
                    buildForm(),
                    SizedBox(height: 10),
                    TextClass(text: 'النوع', fontSize: 25),
                    //dropdownButton for Gender
                    dropdownButton(
                      key: _genderKey,
                      hintText: 'اختر النوع',
                      validator: (value) =>
                          value == null ? "من فضلك اختر النوع" : null,
                      items: ['ذكر', 'انثي', 'اخري']
                          .map((label) => DropdownMenuItem(
                                child: TextClass(text: label.toString()),
                                value: label,
                              ))
                          .toList(),
                    ),
                    //location
                    SizedBox(height: 10),
                    TextClass(text: 'مكان الفقدان', fontSize: 25),
                    //dropdownButton for City
                    dropdownButton(
                      key: _citiesKey,
                      hintText: 'اختر المحافظه',
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
                      hintText: 'اختر المنطقه',
                      validator: (value) =>
                          value == null ? "من فضلك اختر المنطقه" : null,
                      items: ['حلوان', 'دار السلام', 'اخري']
                          .map((label) => DropdownMenuItem(
                                child: TextClass(text: label.toString()),
                                value: label,
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 10),
                    // more title details
                    TextField(
                      controller: moreTitleDetails,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: 'ادخل باقي تفاصيل العنوان',
                      ),
                      style: TextStyle(
                          color: lightGrey, fontFamily: 'Tajawal', height: 0),
                    ),
                    SizedBox(height: 20),
                    TextClass(
                      text: 'التفاصيل',
                      fontSize: 25,
                    ),

                    TextField(
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: 'ادخل المزيد من التفاصيل',
                      ),
                      style: TextStyle(height: 8.0, fontSize: 15),
                      controller: detailBox,
                    ),
                    SizedBox(height: 20),
                    //add photos
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: TextClass(
                        textAlign: TextAlign.start,
                        text: 'اضافه صوره او اكثر',
                        fontSize: 25,
                      ),
                    ),
                    // add picture
                    containerPhotos(context),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: RaisedButtonClass(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _genderKey.currentState!.validate() &&
                                _citiesKey.currentState!.validate() &&
                                _key.currentState!.validate()) print('okey');
                            print(AddPersonDataCubit.get(context)
                                .listPhoto
                                .length);
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
      },
    );
  }

  containerPhotos(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      child: (AddPersonDataCubit.get(context).listPhoto.length == 0)
          ? Center(child: addPicture('assets/images/osman.jpg'))
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AddPersonDataCubit.get(context).listPhoto.length + 1,
              itemBuilder: (context, index) {
                return index == 0
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: addPicture('assets/images/osman.jpg'))
                    : Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child:
                            //ClipOval(
                            //   child:
                            Image.asset(
                          'assets/images/IMG20201116145812.jpg',
                          height: 180,
                          width: 180,
                          fit: BoxFit.cover,
                        ),

                        //  ),
                      );
              },
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
              AddPersonDataCubit.get(context).addPicture();
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
          SizedBox(height: 10),
          TextClass(text: 'الاسم', fontSize: 25),
          TextFormFieldClass(
            roundedRectangleBorder: 10,
            controller: personName,
            textHint: 'ادخل اسم المفقود',
            textColor: lightGrey,
            validator: (value) =>
                value!.isEmpty ? 'من فضلك ادخل اسم المفقود' : null,
          ),
          //age
          SizedBox(height: 10),
          TextClass(text: 'الفئه العمريه', fontSize: 25),
          TextFormFieldClass(
            roundedRectangleBorder: 10,
            controller: personAge,
            keyboardType: TextInputType.number,
            textHint: 'ادخل العمر التقريبي',
            textColor: lightGrey,
            validator: (value) =>
                value!.isEmpty ? 'من فضلك ادخل العمر التقريبي' : null,
          ),
        ],
      ),
    );
  }

  dropdownButton({
    required key,
    required hintText,
    required validator,
    required items,
  }) {
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
            hint: TextClass(text: hintText, textColor: lightGrey),
            icon: Icon(Icons.keyboard_arrow_down_outlined, size: 30),
            validator: validator,
            dropdownColor: Colors.grey[200],
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: items),
      ),
    );
  }
}
