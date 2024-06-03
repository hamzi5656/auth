// import 'package:flutter/material.dart';
// import 'package:persistent_shopping_cart/model/cart_model.dart';
// import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
// class ProductDetail extends StatelessWidget {
//   Map productDetails;
//    ProductDetail({super.key,required this.productDetails});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: 
//     Column(children: [
//       Expanded(flex:3,
//         child: 
//    Container(
//   child: Stack(children: [    Center(child: Padding(
//     padding: const EdgeInsets.only(top: 30),
//     child: Image(image: NetworkImage("${productDetails["img"]}")),
//   )),
  
//   Positioned(top: 30,right: 30,
//     child: Icon(Icons.favorite_outline,size: 28,)
//     ),
//     Positioned(top: 30,left: 10,
//     child:IconButton(onPressed: (){
//       Navigator.pop(context);
//     }, icon: Icon(Icons.arrow_back))
//     ),
  
//     ],),
// ),
//     ),
//     Expanded(flex: 3,
//       child: Column(
//         children: [
//        Card(child:
//         Padding(
//           padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
//           child: Column(mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//          Text("${productDetails["name"]}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
//             SizedBox(height: 10,),
//           Text("${productDetails["description"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
//         SizedBox(height: 10,),
//           Text("${productDetails["price"]} "+"PKR",style: TextStyle(fontWeight:FontWeight.bold,
//             color: Colors.deepPurple,fontSize: 20
//             ),),
//           SizedBox(height: 10,),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
              
//               Text("${productDetails["duration"]}",style: TextStyle(fontSize: 16,),),
              
              
//             ]
// ),
//         const SizedBox(height: 10,),
//       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Status:",style: TextStyle(fontSize: 16,),),
//               Text("${productDetails["status"]== true ? "In Stock": "Out Of Stock"}"),
              
//             ]
// )
// ],),
// ),),
// Card(
//   child: Padding(
//     padding: const EdgeInsets.only(top: 20,left: 20,right: 10,bottom: 20),
//     child: Column(mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text("Reviews",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//     SizedBox(height: 15,),
//     Text("There will be the Reviwes of user that will be against the product ")
//     ],),
//   ),)
//   ],))
   
//     ]
//     ,),

//     bottomSheet: Container(color: Colors.white,
//       height: 70,child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children:  [
//       TextButton(onPressed: (){},child: Text("Counter",
//         style: TextStyle(color: Colors.black,fontSize: 20),),),
//         PersistentShoppingCart().showAndUpdateCartItemWidget(
//           inCartWidget: Text("Add",style: TextStyle(color: Colors.green,fontSize: 18),),
//            notInCartWidget:  Text("Remove",style: TextStyle(color: Colors.red,fontSize: 18),),
//            product: PersistentShoppingCartItem(
//             productId: "12",
//              productName: "11", 
//              unitPrice: 2, 
//              quantity: 2))
     
                  
//         ],),),
//         );
//   }
// }
import 'package:auth/models/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class ProductDetail extends StatelessWidget {
  Map productDetails;

  ProductDetail({super.key, Key , required this.productDetails});
  @override
  Widget build(BuildContext context) {
    Timestamp durationTimestamp = productDetails['duration'];
    DateTime durationDateTime = durationTimestamp.toDate();

    // Extracting hours from DateTime object
    int hours = durationDateTime.hour;
    List<productModel> itemlist=[
      productModel(productId:"${productDetails["id"]}"  , productNAme: "${productDetails["name"]}", productDesc: "${productDetails["description"]}", productImg: "${productDetails["img"]}", price:  double.parse("${productDetails["price"]}"))

    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image(
                        image: NetworkImage("${productDetails["img"]}"),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 30,
                    right: 30,
                    child: Icon(Icons.favorite_outline, size: 28),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${productDetails["name"]}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Descripton ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        Text(
                          "${productDetails["description"]}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,color: Colors.black.withOpacity(.7)
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${productDetails["price"]} PKR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple.withOpacity(.8),
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Duration: $hours hours",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Status:",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              productDetails["status"] == true ? "In Stock" : "Out Of Stock",style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Card(color: Colors.white,
                shadowColor: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "There will be the Reviews of users that will be against the product.",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Cart",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            PersistentShoppingCart().showAndUpdateCartItemWidget(
              inCartWidget: const Text(
                "Remove",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              notInCartWidget: const Text(
                "Add",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              product: PersistentShoppingCartItem(
                productId:"${productDetails["id"]}",
                productName: "${productDetails["name"]}",
                unitPrice: double.parse("${productDetails["price"]}"),
                quantity:1,
                productThumbnail: "${productDetails["img"]}",
              
              ),
            ),
          ],
        ),  
      ),
    );
  }
}
