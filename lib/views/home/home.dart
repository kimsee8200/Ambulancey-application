import 'package:flutter/material.dart';
import 'package:ambulancey/models/hospital_model.dart';
import 'package:ambulancey/views/hospital/hospital_list.dart';
import 'package:ambulancey/views/common/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showHospitalDetail(int i){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HospitalList(
        data: const [
          HospitalModel(
            id: 1,
            name: '동대전정신병원',
            type: '정신과',
            description: 'desc',
            openTime: '12',
            isOpen: false,
            address: 'asdf',
            star: 4.5
          ),
          HospitalModel(
            id: 2,
            name: '동대전정신병원2',
            type: '정신과',
            description: 'desc',
            openTime: '12',
            isOpen: false,
            address: 'asdf',
            star: 3.7
          ),
          HospitalModel(
            id: 3,
            name: '동대전정신병원2',
            type: '정신과',
            description: 'desc',
            openTime: '12',
            isOpen: false,
            address: 'asdf',
            star: 2.7
          ),
          HospitalModel(
            id: 4,
            name: '동대전정신병원2',
            type: '정신과',
            description: 'desc',
            openTime: '12',
            isOpen: false,
            address: 'asdf',
            star: 4.0
          )
        ],
        onTap: (_){}
      ),
      floatingActionButton: FloatingButton(onPressed: (){})
    );
  }
}
