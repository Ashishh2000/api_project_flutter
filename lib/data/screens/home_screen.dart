import 'package:api_project/data/data_sources/home/home_http_data_source.dart';
import 'package:flutter/material.dart';

import '../dto/home_dto.dart';
import 'ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

//  Map<String,dynamic> usersData = {};

 var usersData = HomeDto.fromJson({});

  @override
  void initState(){
    super.initState();
    loadingUserData();

  // final myData =  HomeHttpDataSource.getUsersData();
  // print('Data : $myData');
  }

  void loadingUserData() async{
    final myData = await HomeHttpDataSource.getUsersData();
   // print('Data : $myData');

    setState(() {
      usersData = myData;
    });
  }

  @override
  Widget build(BuildContext context) {

    //  HomeHttpDataSource.getUsersData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:const Center(
          child: Text('Dashboard',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context,index){
          return Card(
              child: ListTile(
                title: Text('${usersData.users?[index].name}'),
                trailing: TextButton(onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> PersonalDetailsScreen()),
                  );
                }, child: const Text('Click Here')),
              ),
            );
          },
          separatorBuilder: (context,index){
            return const Divider(height: 15,thickness: 3,);
          },
          itemCount: usersData.users?.length??0,
      ),
    );
  }
}







