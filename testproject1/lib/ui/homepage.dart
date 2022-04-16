import 'package:flutter/material.dart';
//import 'package:icon/icon.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //TextEditingController _controller=TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff25627F),
   
      body:  Column(
        children: [
        SizedBox(
          height: 50,
          child: Padding(
          padding: const  EdgeInsets.only(right: 15,left: 15),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children:const [
               Icon(Icons.arrow_back_ios, color: Colors.white,),
              Text("Doctors",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,fontWeight: FontWeight.bold),),
            ],),
             const Icon(Icons.
             filter_list_rounded,color: Colors.white,),
          ],
          ),
        ),
        ),


        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height -110,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                 Icon(Icons.local_hospital_outlined, color: Color(0xff0081A7),size: 12,),
                Text(" Nearby Doctors", 
               style: TextStyle(
                color: Color(0xff25627F),
                fontSize: 12,),),
              ],
              ),
              const SizedBox(height: 15,),

            SizedBox(
            height: 50,
            width: 400,
            child: TextField(
                onTap: () {},
                decoration: InputDecoration(
                    hintText: "Ram bahadur magar",
                    hintStyle: const TextStyle(color: Colors.black38),
                    suffixIcon: IconButton(
                      onPressed: () {},
                        icon:const Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 30,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                         const BorderSide(width: 1, color: Color(0xff25627F),),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black54),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    ),
                    ),
                    ),
          //     SizedBox(
          //        height: 60,
          //        width: 300,
          //        child: TextField(
          //        decoration: InputDecoration(
          //        enabledBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(width: 1, color: Color(0xff25627F),),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       hintText: "Ram bahadur magar",
          //       hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black38),
          //       suffixIcon: IconButton(
          //        onPressed: () => _controller.clear(),
          //       icon:const Icon(
          //       Icons.search,
          //       color: Colors.blue,
          //       size: 30,),
          //   ),
          //  ),
          //  ),
          //  ),
           const SizedBox(height: 10,),
           

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:  [
               const Padding(
               padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),),
                        Column(
                          children: [
                            Container(
                             // child: Icons.water_drop,
                              padding: const  EdgeInsets.only(left: 5),
                              width: 70,
                              height: 70,
                              decoration:const BoxDecoration(
                               color: Color(0xff25627F),
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              ), 
                              child:const Center(child: Icon(Icons.water_drop_outlined,color: Colors.white,size: 35,)), 
                            ),
                            const SizedBox(height: 5,),
                             const Text("This is Function", 
               style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,fontSize: 11),),
                          ],
                        ),

                         Column(
                           children: [
                             Container(
                              width: 70,
                              height: 70,
                              decoration:const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                               color: Color(0xff25627F),
                              ),
                               child:const Center(child: Icon(Icons.water_drop,color: Colors.white,size: 35,)),
                        ),
                         const SizedBox(height: 5,),
                          const Text("This is Function", 
               style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,fontSize: 11),),
                           ],
                         ),

                         Column(
                           children: [
                             Container(
                              // child: Icons.water_drop,
                              width: 70,
                              height: 70,
                              decoration:const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color(0xff25627F),
                              ),
                               child:const Center(child: Icon(Icons.person_add,color: Colors.white,size: 35,)),
                             
                        ),
                         const SizedBox(height: 5,),
                         const  Text("This is Function", 
               style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,fontSize: 11),),
                           ],
                         ),

                         Column(
                           children: [
                             Container(
                              width: 70,
                              height: 70,
                              decoration:const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Color(0xff25627F),
                              ),
                               //child:const Center(child: Icon(Icons.water_drop_outlined,color: Colors.white,size: 35,)),
                              
                        ),
                         const SizedBox(height: 5,),
                        const Text("")
                           ],
                         ),
             ],
           ),

         
         const SizedBox(height:20),
         
           Expanded(
             child: SizedBox(
               child: ListView.builder(
                   itemCount: 10,
                   itemBuilder: (BuildContext context,int index){
                     return Container(
                      
                 width: MediaQuery.of(context).size.width,
                 margin: const EdgeInsets.only(bottom: 15),
                 padding: const EdgeInsets.all(15),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(15),
                   boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                   spreadRadius: 2,
                   blurRadius: 3,
                   offset: const Offset(0, 2), // changes position of shadow
                 ),
               ],
                 ),
                 child: Column(children: [
                   Row(children: [
                     Container(
                        child: 
                      const  Center(
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                          ),
                        ),
                       width: 70,
                       height: 70,
                       decoration:const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                       color: Color(0xff25627F),
                       ),
                     
                       
                     ),
                     const  SizedBox(width: 15,),
                     Expanded(
                       child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [
                         Text("Ram Bahadur BK '........'",
                         style: TextStyle(
                           color: Color(0xff25627F),fontWeight: FontWeight.bold)),
                         SizedBox(height: 5,),
                         Text("General Physician",style: TextStyle(fontSize: 13),),
                        SizedBox(height: 5,),
                         Text("General Physician",style: TextStyle(fontSize: 12),),
                         SizedBox(height: 5,),
                       ],),
                       
                     ],)),
                  
                   ],),
           
                 ]),
                );
               }
              ),
             ),
           ),
             


      ],
    ),
   ),


        ],
    ),

    );
  }
}
