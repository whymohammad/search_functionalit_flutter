import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notifications/data.dart';
import 'package:notifications/servcies/local_notification.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  TextEditingController controller = TextEditingController();
  List<records> items = [
    records(desc: 'this is a banana', prics: '120', title: 'Banana'),
    records(desc: 'this is a lolipop', prics: '10', title: 'lolipop'),
    records(desc: 'this is a kabab', prics: '150', title: 'kabob'),
    records(desc: 'this is a totot', prics: '10', title: 'totot'),
  ];
  List<records> searchlist = [];

  fetchrecords(){
    setState(() {
      searchlist = items;
    });
  }

  initState(){
    super.initState();
    fetchrecords();

  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onChanged: (value) {
                    value= controller.text;
                    searchlist = items
                        .where((element) =>
                            element.title.toString().toLowerCase().contains(
                                  value.toLowerCase(),
                                ))
                        .toList();
                    setState(() {});
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[120],
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: searchlist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${searchlist[index].title}'),
                        subtitle: Text('${searchlist[index].desc}'),
                        trailing: Text('${searchlist[index].prics}/price'),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
