import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/random_user_provider.dart';
import 'package:untitled/Screens/gender_screen.dart';
import 'package:untitled/Widgets/custom_felid.dart';
import 'package:untitled/Widgets/custom_user_details.dart';

class RandomUsersScreen extends StatelessWidget {
  const RandomUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:    Consumer<RandomUserProvider>(builder: (context, value, child) {

        var data = value.model?.users;

        if(data == null  )
        {
          value.getRandom();
          return Center(child: CircularProgressIndicator());

        }
        else
        {

          return Scaffold(
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> GenderScreen(gender: "male")));
                    },
                    child: Column(
                      children: [
                        Icon(Icons.male),
                        const SizedBox(height: 5,),
                        const Text('Male')
                      ],
                    ) ,
                ),
                const SizedBox(width: 10,),
                FloatingActionButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GenderScreen(gender: "female")));
                  },
                  child: Column(
                    children: [
                      Icon(Icons.female),
                      const SizedBox(height: 5,),
                      const Text('Female')
                    ],
                  ) ,
                ),
              ],
            ),
            body: Expanded(
              
                child: ListView.separated(
                itemBuilder: (context, index){

                  return  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomUserDetails(
                          email:"${data[index]['email']}" ,
                          address : "${data[index]['location']['street']['number']} / ${data[index]['location']['street']['name']},",
                          name: "${data[index]['name']['first'] } , ${ data[index]['name']['last']}",
                          image: data[index]['picture']['large'] )));
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 3.4,
                      surfaceTintColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomField(
                        address: "${data[index]['location']['street']['number']} / ${data[index]['location']['street']['name']}",
                        image: data[index]['picture']['large'] ,
                        name: data[index]['email'] ,),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: data.length)) ,
          );
        }
      },),
    );
  }
}
