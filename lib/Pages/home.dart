import 'package:flutter/material.dart';
import 'package:simpleapp/FetchData/FetchData.dart';

import '../FetchData/Person.dart';
import '../FetchData/CreditCard.dart' ;

class Home extends StatefulWidget{
  @override
  State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home>{
   List<CreditCard> _list=<CreditCard>[];
   // Future<List<CreditCard>> Flist=fetch();
   late Future<List<CreditCard>> Flist;
  @override
  void initState(){
    // fetch().then((value) => setState(
    //         (){
    //       _list.addAll(value);
    //     }
    // ));
    Flist=fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Center(
        // child: ListView.builder(
        //         itemCount: _list.length ,
        //           itemBuilder: (context , index){
        //           return Container(
        //             width: 100,
        //             height:100,
        //             child: Card(
        //
        //               color: Colors.blue,
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(12.0),
        //               ),
        //               elevation: 50,
        //               shadowColor: Colors.black,
        //               child: ListTile(
        //                 leading: const Icon(Icons.list),
        //                 subtitle: Text(_list[index].email),
        //                 title: Text(_list[index].name),
        //               ),
        //             ),
        //           );
        //         })
        child:FutureBuilder(
          future: Flist,
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              _list.addAll(snapshot.data);
              print(_list[0].number);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(

                    height: 300,
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: Card(

                      clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                      // color: Colors.cyan,
                      elevation: 5,

                      child: Stack(

                        children:[
                          const Image(
                            image: AssetImage(
                                "lib/images/Background.png"
                            ),fit: BoxFit.cover,
                            height: 600,

                        ),
                          ListTile(
                            onTap: (){

                            },
                          contentPadding: const EdgeInsets.fromLTRB(200, 0, 0, 0),
                          title:Text(_list[index].type,style: const TextStyle(color: Colors.white,fontSize: 30),) ,
                          subtitle: Text(_list[index].number.toString(),style: const TextStyle(color: Colors.white,fontSize: 15),),
                        ),
                          Positioned(bottom:10 ,left: 10, child: Text(_list[index].expiry,style: const TextStyle(color: Colors.white,fontSize: 30),),)
                          ,Positioned(bottom:10 ,right: 20, child: Text(_list[index].cvc.toString(),style: const TextStyle(color: Colors.white,fontSize: 30),),)
                    ]
                      ),
                    ),

                  );
                },
              );

            }else if(snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        )
      ),
    );

  }
}
