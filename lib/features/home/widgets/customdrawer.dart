import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget customDrawer(BuildContext context){
  return  Drawer(
    shape:const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
    child: Padding(
      padding:const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height:40,),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(onPressed: (){context.pop();}, icon:const Icon(Icons.close))),
          const SizedBox(height:10,),          
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ankush Prajapati",style: TextStyle(fontSize:17, fontWeight: FontWeight.bold),),
                    Text("abc@gmail.com",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border:Border.all(color: Colors.grey)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('⭐ 4.1',style: TextStyle(fontSize:15),),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(radius:23,backgroundColor: Colors.blue,child: Icon(Icons.leaderboard,size:25,),),
                    SizedBox(height: 10,),
                    Text("Prefrances",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(radius: 23,backgroundColor: Colors.blue,child: Icon(Icons.file_copy_outlined,size:25,),),
                    SizedBox(height: 10,),
                    Text("Resume",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(radius:23,backgroundColor: Colors.blue,child: Icon(Icons.copy_all_sharp,size:25,),),
                    SizedBox(height: 10,),
                    Text("Application",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,width: double.infinity,),
          const Divider(thickness:1.5,indent: 1,),
          const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Explore',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: Colors.grey)),
            SizedBox(height: 10,width: double.infinity,),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.send),
              title: Text('Intenships',style: TextStyle(fontSize:16, fontWeight: FontWeight.w500)),),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.balcony_outlined),
              title: Text('Jobs',style: TextStyle(fontSize:16, fontWeight: FontWeight.w500)),),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.computer_rounded),
              title: Text('Cources',style: TextStyle(fontSize:16, fontWeight: FontWeight.w500)),),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text('Placement Guarantee Cources',style: TextStyle(fontSize:16, fontWeight: FontWeight.w500)),),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.work_outline),
              title: Text('Study Abrod',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.laptop),
              title: Text('Online Degree',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),),
            SizedBox(height: 20,width: double.infinity,),
            Divider(thickness:1.5,indent: 1,),
            Text('Contact Us',style: TextStyle(fontSize:15, fontWeight: FontWeight.bold,color: Colors.grey)),
            SizedBox(height: 10,width: double.infinity,),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.help),
              title: Text('Help?',style: TextStyle(fontSize:16, fontWeight: FontWeight.w500)),),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.report),
              title: Text('Report a Complaint',style: TextStyle(fontSize:16, fontWeight: FontWeight.w500)),),
            ListTile(
              minTileHeight: 0,
              leading: Icon(Icons.add_box_outlined),
              title: Text('More',style: TextStyle(fontSize:16, fontWeight: FontWeight.w500)),),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}