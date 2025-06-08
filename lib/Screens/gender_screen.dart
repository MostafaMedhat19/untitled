import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/gender_random_provider.dart';
import 'package:untitled/Providers/random_user_provider.dart';
import 'package:untitled/Widgets/custom_felid.dart';

import '../Widgets/custom_user_details.dart';

class GenderScreen extends StatelessWidget {
  String gender ;
   GenderScreen({super.key , required this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:    Consumer<GenderProvider>(builder: (context, value, child) {


        var data = value.model?.genderUsers;

        if(data == null  )
        {
          value.getGender(gender);
          return Center(child: CircularProgressIndicator());

        }
        else
        {

          return Scaffold(
             floatingActionButton: FloatingActionButton(
               onPressed: () => Navigator.pop(context),
               child: Icon(Icons.arrow_back), // optional
             ),
            body: Expanded(

                child: ListView.separated(
                    itemBuilder: (context, index){

                      return  GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomUserDetails( description : data[index]['timezone']['description'],name: data[index]['name']['first'], image: data[index]['picture']['large'] )));
                        },
                        child: CustomField(
                          address: data[index]['location']['street']['name'],
                          image: data[index]['picture']['large'] ,
                          name:data[index]['name']['first'] ,),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: data.length)),
          );
        }
      },),
    );
  }
}
