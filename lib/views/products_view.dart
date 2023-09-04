import 'package:flutter/material.dart';
import 'package:hunter/constants/icons.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          const BackButton(
            style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
          ),
          const Spacer(),
           Column(
             children: [
               Text('home',style: Theme.of(context).textTheme.titleLarge,),
               Text('150 Products',style: Theme.of(context).textTheme.bodyLarge,),
             ],
           ),
          const Spacer(),
          IconButton(onPressed: (){}, icon: const Icon(MyIcon.search,size:18 ,)),
        ],
      ),
    );
  }
}
