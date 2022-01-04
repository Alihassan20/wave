import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_kareem/Color/color.dart';
import 'package:quran_kareem/screen/home.dart';
import 'package:quran_kareem/tasbeh/view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Time/view.dart';
import '../azkar/view.dart';
import '../quibla/view.dart';
import '../widget/wave.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txt= const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20
    );
    Future<bool> _onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:  Text('هل انت متأكد ؟',style: txt,),
          content:  Text('هل تريد الخروج من التطبيق .',style: txt,),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child:  Text('لا',style: txt,),
            ),
            TextButton(
              onPressed: () => SystemNavigator.pop(),
              child:  Text('نعم',style: txt,),
            ),
          ],
        ),
      )) ??
          false;
    }
    var size= MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(152, 186, 231, 1),
          body: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/1.4),
                child: Image.asset('Image/mosque.png', fit: BoxFit.cover,width: double.infinity,
                  color: kContainerColor,
                  height: 200,),
              ),
              Padding(
                padding:  EdgeInsets.only(top: size.height/18),
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Image.asset('Image/logoo.png',width: size.width/4),
                       const  Text("AlQuran _ القرآن",style: TextStyle(fontFamily: 'quraan',fontSize: 20,fontWeight: FontWeight.bold),)
                      ],
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.219,
                    left: 20,
                    right: 20
                  ),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Home()));
                            },
                            child: Container(

                                height: size.height/7.5,
                                width: size.width/1.15,
                                decoration:  BoxDecoration(
                                  color: const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.7),
                                  borderRadius:const BorderRadius.all(Radius.circular(15)),
                                  boxShadow:const  [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                    )
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        child: WaveDemoHomePage()),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset('Image/q.png',
                                            fit: BoxFit.fill),
                                        const  Text("القرآن الكريم"
                                            ,style: TextStyle(fontFamily:'ArefRuqaa',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25 ))
                                      ],
                                    ),
                                  ],
                                )
                            ),
                          ),
                         const  SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>QeblaView()));

                                    },
                                    child: Container (
                                      height: size.height/4.7,
                                      width:size.width/2.4,
                                      decoration:  BoxDecoration(
                                        color: const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.9),
                                        borderRadius:const BorderRadius.all(Radius.circular(15)),
                                        boxShadow:const  [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: WaveDemoHomePage()),
                                          Center(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.asset('Image/ka3ba.png',height: size.height/6.4, fit: BoxFit.fill),
                                                const Text("القبلة",
                                                    style: TextStyle(fontFamily:'ArefRuqaa',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23 ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const  SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Azkar()));

                                    },
                                    child: Container (
                                      height: size.height/3.7,
                                      width:size.width/2.4,
                                      decoration:  BoxDecoration(
                                        color: const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.8),
                                        borderRadius:const BorderRadius.all(Radius.circular(15)),
                                        boxShadow:const  [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                      child: Stack(

                                        children: [
                                          ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: WaveDemoHomePage()),

                                          Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Image.asset('Image/mslim.png',
                                                  fit: BoxFit.fill,height: size.height/6,),
                                                const Text("الأذكار",
                                                    style: TextStyle(fontFamily:'ArefRuqaa',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25 )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [

                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Tasbeh()));

                                    },
                                    child: Container (
                                      height: size.height/3.7,
                                      width:size.width/2.4,
                                      decoration:  BoxDecoration(
                                        color: const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.8),
                                        borderRadius:const BorderRadius.all(Radius.circular(15)),
                                        boxShadow:const  [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                      child: Stack(
                                       children: [
                                         ClipRRect(
                                             borderRadius: const BorderRadius.all(Radius.circular(10)),
                                             child: WaveDemoHomePage()),
                                         Center(
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Image.asset('Image/sb.png',
                                                 fit: BoxFit.fill ,height: size.height/6,),
                                               const Text("التسبيح",style: TextStyle(fontFamily:'ArefRuqaa',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20 )),
                                             ],
                                           ),
                                         ),
                                       ],
                                      ),
                                    ),
                                  ),
                                  const  SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PrayTimes()));
                                    },
                                    child: Container (
                                      height: size.height/4.7,
                                      width:size.width/2.4,
                                      decoration:  BoxDecoration(
                                        color: const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.9),
                                        borderRadius:const BorderRadius.all(Radius.circular(15)),
                                        boxShadow:const  [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                          )
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: WaveDemoHomePage()),
                                          Center(
                                            child: Column(
                                              children: [
                                                Image.asset('Image/timee.png',height: size.height/6.5, fit: BoxFit.fill,color: const Color.fromRGBO(26, 55, 77, 1),),
                                                const Text("مواقيد الصلاة",style: TextStyle(fontFamily:'ArefRuqaa',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23 ,))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const  SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: GestureDetector(
                                  onTap: (){
                                    // Share.share()
                                  },
                                  child:  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children:  [
                                          GestureDetector(
                                            onTap: ()async{
                                              await launch(
                                                  "https://play.google.com/store/apps/details?id=com.example.quran_kareem");
                                            },
                                            child: const Text("مشاركة التطبيق ",style: TextStyle(fontFamily:'ArefRuqaa',fontWeight: FontWeight.bold,fontSize: 23 ,),
                                            ),
                                          ),
                                          Container(
                                              height:50,
                                              width:50,
                                              child: Image.asset('Image/C.png')),
                                        ],
                                      ),
                                    ),
                                  ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: GestureDetector(
                                  onTap: () async{

                                    await launch(
                                        "https://wa.me/${2001206614841}?text=Hello");
                                  },
                                  child:  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children:  [
                                          const Text(" تواصل معنا  ",style: TextStyle(fontFamily:'ArefRuqaa',fontWeight: FontWeight.bold,fontSize: 23 ,),
                                          ),
                                          Container(
                                              height:50,
                                              width:50,
                                              child: Image.asset('Image/wh.png')),

                                        ],
                                      ),
                                    ),
                                  ),),
                              ),

                            ],
                          ),


                        ],
                      ),
                    ],
                  )),
              Padding(
                padding:  EdgeInsets.only(top: size.height/1.02,left: size.width/1.35),
                child: const Text("Developed By Ali El_Mahdy",style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 8
                )),
              ),



            ],
          )),
    );
  }
}
