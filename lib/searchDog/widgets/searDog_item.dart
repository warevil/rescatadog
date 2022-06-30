import 'package:flutter/material.dart';

class SearchDogItem extends StatelessWidget {
  const SearchDogItem(this.dogData, {Key? key}) : super(key: key);
  final Map<String, dynamic> dogData;

  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {},
            child: Container(
              height: 230,
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    left: 20,
                    right: 20,
                    child: Material(
                      child: Container(
                        height: 180.0,
                        width: 500 * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 30,
                      child: Card(
                        elevation: 10.0,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(dogData['image'])),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 200,
                      child: Container(
                        height: 150,
                        width: 500,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      dogData['name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF363f93),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      child: Icon(Icons.male),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  dogData['race'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "${dogData['age']} años",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(Icons.location_on),
                                    ),
                                    Text(
                                      dogData['address'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ))
                ],
              ),
            )),
      ],
    );
  }
}
