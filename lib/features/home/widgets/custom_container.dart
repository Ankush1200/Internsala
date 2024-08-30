import 'package:flutter/material.dart';

Widget customContainer({String ?jobTitle,String? companyName,String?companyLogo,
    bool?isWFH,String?salary,String?duration,String?postedBy,List?locations,
    String?deadLine
  }){
  return Card(
    margin:const EdgeInsets.only(bottom: 8),
    child: Container(
      color:Colors.white,
      // margin: const EdgeInsets.all(5),
      padding:const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jobTitle!,style: const TextStyle(fontSize:18, fontWeight: FontWeight.w500)),
                  Text(companyName!,overflow: TextOverflow.ellipsis,softWrap:false,maxLines: 1,style:  const TextStyle(fontSize:15, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const Expanded(
              flex:1,
              child: SizedBox(width:5,)),
          ],
        ),
        const SizedBox(height: 10,width: double.infinity,),
          Row(
          children: [
            const Icon(Icons.location_on,size: 15),
            const SizedBox(width: 10,),
            Text(locations!.isEmpty?'Gurgaon':locations[0]),
          ],
        ),
        const SizedBox(height:5,width: double.infinity,),
        Row(
          children: [
            Row(
              children: [
                const Icon(Icons.play_circle_outline,size: 15),
                const SizedBox(width: 10,),
                isWFH! ?const Text("Remote"):const Text('Office'),
              ],
            ),
            const SizedBox(width: 10,),
            Row(
              children: [
                const Icon(Icons.calendar_today,size: 15),
                const SizedBox(width: 10,),
                Text("${duration!.split('the_').last.split('_').first} Months"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15,width: double.infinity,), 
         Card(
          elevation: 0,
          color: Colors.grey.withOpacity(0.2),
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal:8.0,vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.price_change_outlined,size: 15),
            const SizedBox(width: 10,),
            Text(salary!),
            const SizedBox(width: 5,),
          ],
        ),
          ),
        ),
        Row(
          children: [
            Card(
              elevation: 0,
              color:postedBy=='Today'? Colors.green.withOpacity(0.5):postedBy=='1 day ago'? Colors.yellow.withOpacity(0.5):Colors.grey.withOpacity(0.2),
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal:8.0,vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.watch_later_outlined,size: 15,color: Colors.black,),
                    const SizedBox(width: 5,),
                    Text(postedBy!),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              color: Colors.grey.withOpacity(0.2),
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal:8.0,vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // const Icon(Icons.watch_later_outlined,size: 15,color: Colors.black,),
                    // const SizedBox(width: 5,),
                    Text(deadLine!),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Divider(thickness: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: (){}, child:const Text('View Details',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold))),
            const SizedBox(width: 5,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal:30),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.blue),
              onPressed: (){}, child:const Text('Apply',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
          ],
        )
      ],),
    ),
  );
}
