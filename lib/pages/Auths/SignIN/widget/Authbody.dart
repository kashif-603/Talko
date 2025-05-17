import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoginForm.dart';
import 'SignUpForm.dart';

class Authbody extends StatelessWidget {
  const Authbody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = true.obs;

    Color getTextColor(BuildContext context) {
      return Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black;
    }

    return Container(
      padding: EdgeInsets.all(20),
      height: 400,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        isLogin.value = true;
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 2.7,
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: (isLogin.value
                                  ? Theme.of(context).textTheme.bodyLarge
                                  : Theme.of(context).textTheme.labelLarge)
                                  ?.copyWith(
                                fontWeight: isLogin.value
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: getTextColor(context),
                              ),
                            ),
                            SizedBox(height: 5),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width: isLogin.value ? 70 : 0,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        isLogin.value = false;
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 2.7,
                        child: Column(
                          children: [
                            Text(
                              "SignUp",
                              style: (!isLogin.value
                                  ? Theme.of(context).textTheme.bodyLarge
                                  : Theme.of(context).textTheme.labelLarge)
                                  ?.copyWith(
                                fontWeight: !isLogin.value
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: getTextColor(context),
                              ),
                            ),
                            SizedBox(height: 5),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width: !isLogin.value ? 70 : 0,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 20),
                Obx(() => Flexible(
                  child: SingleChildScrollView(
                    child: isLogin.value ? Loginform() : SignUpform(),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
