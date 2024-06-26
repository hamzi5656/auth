import 'package:auth/User/Product/productDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Medical extends StatefulWidget {
  const Medical({super.key});

  @override
  State<Medical> createState() => _MobilityState();
}

class _MobilityState extends State<Medical> {
  List<Map> allMobility=[];
  @override

   void initState() {
      // TODO: implement initState
      super.initState();

      getMobilityProducts();
      }
   getMobilityProducts(){

      FirebaseFirestore.instance.collection("Product").where("category", isEqualTo: "Medical").where("popular", isEqualTo: false).get().then((response) {
      List<Map<String,dynamic>> temp=[];
      for (var element in response.docs) {
      temp.add({...element.data(), "id":element.id });
      }
      allMobility = temp; 
      setState(() { });
      print(allMobility);
      print("=====================");  

      });
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical ",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            ...allMobility.map((e) =>
            // Text(e['name'])
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(productDetails: e)));
              },
              child: 
              Card(margin: const EdgeInsets.all(15),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),),
                  child: Image(image: NetworkImage(e['img']),
                  width: double.infinity,
                  height: 180,fit: BoxFit.cover,
                             ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(e['name'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      const Text("Description",style: TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      
                      Text(e['description'],maxLines: 2,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(.6))),
                      const SizedBox(height: 5,),
                      const Row(children: [
                        Icon(Icons.star,size: 16,color: Colors.green,),
                        Icon(Icons.star,size: 16,color: Colors.green,),
                        Icon(Icons.star,size: 16,color: Colors.green,),
                        Icon(Icons.star,size: 16,color: Colors.green,),
                        ],),
                        const SizedBox(height: 5,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [const Text("Status"), Text(e['status'].toString() == true ? "Out of stock"  :"In Stock ",),],)
                    ],
                  ),
                )
              
                ],),),
        
            )
            
            
            )
            ],),
        ),
        
);
  }
}