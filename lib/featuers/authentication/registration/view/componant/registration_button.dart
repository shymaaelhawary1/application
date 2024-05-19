import 'package:application/core/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:application/featuers/authentication/login/veiw/page/login_page.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key });
  @override
  Widget build(BuildContext context) {
    return  Column(
            children: [
              
      SizedBox(height: MediaQuery.of(context).size.height / 30),

              FilledButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  onPressed: (){
                        Navigator.pushNamed(context, 'login');

                  },
                                    child: const Text("confirm")

        ),
    
      Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("have an account already",style: context.getTheme.textTheme.labelLarge,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      "login",
                      style: TextStyle(
                          color: Colors.green,
                          decorationStyle: TextDecorationStyle.solid,
                          decoration: TextDecoration.underline,
                          decorationThickness: 3),
                    ),
                  ),
                ]
              ),
            ]
        );
        //       }
        // )
        // );
      
          
        }
        
  }

