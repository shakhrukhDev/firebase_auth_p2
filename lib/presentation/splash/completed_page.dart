import 'package:firebase_auth_p2/constants/app_images.dart';
import 'package:firebase_auth_p2/constants/widgets/text_styles.dart';
import 'package:firebase_auth_p2/presentation/main/main_page.dart';
import 'package:flutter/material.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(80, 130, 80, 0),
          child: Column(
            children: [
              SizedBox(
                  width: media.size.width*200/365,
                  height: media.size.height*289/800,
                  child: Image.asset(AppImages.completedImage)),
               const SizedBox(height: 33,),
              Text("Yeay! Completed", style: AppStyle.poppins20xW400Black,),
              Text("Now you are able to order \nsome foods as a self-reward", style: AppStyle.poppins14xW300Gray,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffEB0029),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(media.size.width*200/365, 45),
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  MainPage(),
                        ));
                  }, child: Text("Find Foods", style: AppStyle.poppins14xW500White,)),

            ],
          ),
        )
    );
  }
}
