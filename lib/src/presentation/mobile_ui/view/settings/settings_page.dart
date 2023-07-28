import 'package:ccts/src/presentation/mobile_ui/view/auth_screens/login_and_register.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import "package:flutter/material.dart";


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 186, 187, 187),
          offset: Offset(2, 2),
          blurRadius: 3,
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Settings"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            //----Notifications
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                padding: const EdgeInsets.only(left: 6),
                decoration: containerDecoration(),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 14),
                          child: Icon(
                            Icons.notifications,
                            size: 19,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 19,
                      color: Color.fromARGB(255, 116, 116, 116),
                    ),
                  ],
                ),
              ),
            ),
            //----Accounts
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 12, left: 10),
              decoration: containerDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 14, left: 8, right: 8, bottom: 5),
                    child: Text(
                      "ACCOUNT",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.person_pin,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 14),
                          child: Icon(
                            Icons.business_rounded,
                            size: 19,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Text(
                          "Bussiness Profile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 8, left: 10, right: 14),
                              child: Icon(
                                Icons.security,
                                size: 19,
                                color: Color.fromARGB(255, 116, 116, 116),
                              )),
                          Text(
                            "Security",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //---settings
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 12, left: 10),
              decoration: containerDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 14, left: 8, right: 8, bottom: 5),
                    child: Text(
                      "SETTINGS",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.language_rounded,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Language",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.back_hand_outlined,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Permissions",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //----More
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 12, left: 10),
              decoration: containerDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 14, left: 8, right: 8, bottom: 5),
                    child: Text(
                      "MORE",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // String telSupport = "tel:+977 9861333461";
                      // launchUrl(Uri.parse(telSupport));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.phone_in_talk,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Support",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // String googlePlayLaunch =
                      //     "market://details?id=com.westbund.heros";
                      // launchUrl(Uri.parse(googlePlayLaunch));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.star,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Rate Us",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      // String feedbackEmail =
                      //     "mailto:aniklinkin@gmail.com?subject=Feedback to FitnessGhar&body=";
                      // launchUrl(Uri.parse(feedbackEmail));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.feedback_rounded,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Feedback",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 14),
                          child: Icon(
                            Icons.domain_verification_sharp,
                            size: 19,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Text(
                          "Terms & Policy",
                          style: TextStyle(
                            color: Color.fromARGB(255, 116, 116, 116),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          title: const Text("About Us"),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "This is a Nepal based for construction purpose",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "Developer Contact",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 129, 129, 129),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "aniklinkin@gmail.com",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 129, 129),
                                        fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "+977 9863021878",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 129, 129, 129),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "Jhatapol, Lalitpur",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 129, 129),
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.info_outline_rounded,
                              size: 19,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                          Text(
                            "About Us",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginAndRegister()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.logout,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Log Out",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //----Links to Social Media----
            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(top: 18),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           GestureDetector(
            //             onTap: () => launchUrlString(
            //                 "https://www.facebook.com/aniklinkin0.9"),
            //             child: Padding(
            //               padding: EdgeInsets.only(
            //                   left: 15, right: 15, top: 8, bottom: 5),
            //               child: FaIcon(
            //                 FontAwesomeIcons.facebook,
            //                 size: 28,
            //                 color: Color.fromARGB(255, 116, 116, 116),
            //               ),
            //             ),
            //           ),
            //           GestureDetector(
            //             onTap: () => launchUrlString(
            //                 "https://www.instagram.com/anik_shakya_/"),
            //             child: Padding(
            //               padding: EdgeInsets.only(
            //                   left: 15, right: 15, top: 8, bottom: 5),
            //               child: FaIcon(
            //                 FontAwesomeIcons.instagram,
            //                 size: 28,
            //                 color: Color.fromARGB(255, 116, 116, 116),
            //               ),
            //             ),
            //           ),
            //           GestureDetector(
            //             onTap: () => launchUrlString(
            //                 "https://www.youtube.com/channel/UCN8yO9CrdPjLO23wi7wQBfg"),
            //             child: Padding(
            //               padding: EdgeInsets.only(
            //                   left: 15, right: 15, top: 8, bottom: 5),
            //               child: FaIcon(
            //                 FontAwesomeIcons.youtube,
            //                 size: 28,
            //                 color: Color.fromARGB(255, 116, 116, 116),
            //               ),
            //             ),
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               launchUrlString("https://www.twitter.com");
            //             },
            //             child: Padding(
            //               padding: EdgeInsets.only(
            //                   left: 15, right: 15, top: 8, bottom: 5),
            //               child: FaIcon(
            //                 FontAwesomeIcons.twitter,
            //                 size: 28,
            //                 color: Color.fromARGB(255, 116, 116, 116),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Center(
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           "Developed by WeebTech",
            //           style: TextStyle(
            //             color: Color.fromARGB(255, 156, 156, 156),
            //             fontSize: 13.5,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Center(
            //       child: Padding(
            //         padding: const EdgeInsets.all(5),
            //         child: Text(
            //           "Version 1.0.0",
            //           style: TextStyle(
            //             color: Color.fromARGB(255, 151, 151, 151),
            //             fontSize: 13,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}