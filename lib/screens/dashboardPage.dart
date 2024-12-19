import 'package:esthelogy_project/models/imageModel.dart';
import 'package:esthelogy_project/api/imageApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  late Future<List<ImageModel>> image_list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image_list = ImageApi.getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20,),
            FutureBuilder(
              future: image_list,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: SizedBox(width:50,height: 50,child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  // Divider(height: 10,)
                  return Container(
                    height: 150,
                    // color: Colors.grey,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            foregroundImage: NetworkImage(
                                snapshot.data![index].downloadUrl ?? " "),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  );
                } else {
                  return Center(child: Text('No posts available'));
                }
              },
            ),

            FutureBuilder(
              future: image_list,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  // Divider(height: 10,)
                  return Expanded(
                    child: ListView.separated(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    foregroundImage: NetworkImage(
                                        snapshot.data![index].downloadUrl ?? " "),
                                  ),
                                  SizedBox(width: 10,),
                                  Text('John Doe',style: TextStyle(fontSize:15),)
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                child: Image.network(snapshot.data?[index+10].downloadUrl??"",height: 250,),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 10, separatorBuilder: (BuildContext context, int index) { return Divider(height: 5,); },
                    ),
                  );
                } else {
                  return Center(child: Text('No posts available'));
                }
              },
            )
          ],
        ));
  }
}
