import 'package:flutter/material.dart';

class AppBarDefault extends StatelessWidget implements PreferredSizeWidget{
  const AppBarDefault({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
//      leading: SizedBox(child: Icon(Icons.arrow_back,color: Colors.white,),
//        height: 4,width: 4,),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            child: const SizedBox(
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
              ),
            ),
            onTap: ()=>{
              Navigator.pop(context)
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

}
