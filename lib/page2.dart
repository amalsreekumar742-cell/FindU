import 'package:flutter/material.dart';

class page22 extends StatefulWidget {
  const page22({super.key});

  @override
  State<page22> createState() => _page22State();
}

class _page22State extends State<page22> {
  @override
  Widget build(BuildContext context) {

    // final topics = [
    //   "Marketing Strategy",
    //   "UX Design",
    //   "Excel",
    //   "Adobe Photoshop",
    //   "CRM",
    //   "Photography",
    //   "Content Making"
    // ];
    return Scaffold(

      body: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(height: 40,width: double.infinity,
        child: TextField(
          decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
            labelText: "Search the course",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        prefixIconColor: Colors.grey,
                        
                        
                        
          ),
        ),
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Top Searches",style: TextStyle(fontSize: 17),),
    ),

    Row(
      children: [
        Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(onPressed: (){}, child: Text("Flutter")),

      
    ),
    OutlinedButton(onPressed: (){}, child: Text("Data Science"))

      ],
    ),
    Row(
      children: [
        Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(onPressed: (){}, child: Text("Photography")),

      
    ),
    OutlinedButton(onPressed: (){}, child: Text("Ios Developer"))

      ],
    ),

    //  Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Text("Categories",style: TextStyle(fontSize: 17),),
    // ),

    
















    // Wrap(
    //           spacing: 8, 
    //           runSpacing: 8, 
    //           children: topics.map((topic) {
    //             return ChoiceChip(
    //               label: Text(topic),
    //               selected: topic == "UX Design",
    //               selectedColor: Colors.white,
    //               labelStyle: TextStyle(
    //                 color: topic == "UX Design" ? Colors.blue : Colors.black,
    //               ),
    //               shape: StadiumBorder(
    //                 side: BorderSide(
    //                   color: topic == "UX Design"
    //                       ? Colors.blue
    //                       : Colors.grey.shade300,
    //                 ),
    //               ),
    //               backgroundColor: Colors.white,
    //               onSelected: (_) {},
    //             );
    //           }).toList(),
    //         ),
        ],
      ),
    );
  }
}