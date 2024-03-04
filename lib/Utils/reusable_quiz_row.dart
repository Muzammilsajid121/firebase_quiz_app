import 'package:flutter/material.dart';

class ReusableQuizRow extends StatelessWidget {
  final String firstQuizTitle, firstQuizImage;
  //  secondQuizTitle, secondtQuizImage;
  const ReusableQuizRow({super.key,
   required this.firstQuizImage,
    required this.firstQuizTitle,
    // required this.secondtQuizImage,
    // required this.secondQuizTitle
    });

  @override
  Widget build(BuildContext context) {
    return 
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,width: 130,
                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                       color: Colors.white
                    ),
                    child: Column(
                      children: [
                          Image.asset(firstQuizImage,height: 80,),
                          const SizedBox(height: 10,),
                             Text(firstQuizTitle, style: Theme.of(context).textTheme.bodyLarge,),
                      ],),
                  ),
                ),
              );    
  }
}