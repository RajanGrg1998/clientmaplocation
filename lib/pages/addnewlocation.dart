import 'package:flutter/material.dart';
import 'package:map_location_app/utils/primary_button.dart';
import 'package:map_location_app/utils/textlabel.dart';
import 'package:map_location_app/utils/widegets.dart';

import 'maplocationscreen.dart';

class AddNewLocation extends StatelessWidget {
  const AddNewLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        centerTitle: true,
        title: TextLabel(labelTitle: 'Add New Location'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLabel(labelTitle: 'Selected Location'),
                  textButton(context),
                ],
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration:
                      buildInputDecoration('Enter Location', Icons.location_on),
                ),
              ),
              sizedBox(),
              TextLabel(labelTitle: 'House no (optional)'),
              sizedBox(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration: buildInputDecoration(
                      'Enter House no', Icons.house_outlined),
                ),
              ),
              sizedBox(),
              TextLabel(labelTitle: 'Street name (optional)'),
              sizedBox(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration: buildInputDecoration(
                      'Enter Street name', Icons.location_on),
                ),
              ),
              sizedBox(),
              TextLabel(labelTitle: 'Nearby landmark (optional)'),
              sizedBox(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration: buildInputDecoration(
                      'Enter Nearby landmark', Icons.gps_fixed_outlined),
                ),
              ),
              SizedBox(height: 130),
              Center(
                child: PrimaryButton(
                  title: 'Add Location',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextButton textButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapLocationScreen()),
        );
      },
      child: Text(
        'Change',
        style: TextStyle(
          fontSize: 12,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  SizedBox sizedBox() => SizedBox(height: 18);
}
