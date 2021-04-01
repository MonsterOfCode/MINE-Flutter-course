import 'package:flutter/material.dart';
import 'package:personal_trainers/widgets/home.header.widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HomeHeader(),
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // Container for Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide: BorderSide(color: Colors.grey.shade800),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                    hintText: "Search by your pt",
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              // Container for slider
              Container(
                height: 300,
                width: double.infinity,
                child: PageView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: ClipRRect(
                        child: Image.asset(
                          "assets/2.jpg",
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: ClipRRect(
                        child: Image.asset(
                          "assets/1.jpg",
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // Container for skills
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Skills",
                      style:
                          TextStyle(color: Colors.grey.shade100, fontSize: 24),
                    ),
                    Text(
                      "Add your skill tag so that people can search",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              // Container for skills tags
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 10,
                  children: [
                    Chip(
                      label: Text(
                        "Fitness",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                    Chip(
                      label: Text(
                        "Trainer",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                    Chip(
                      label: Text(
                        "Gym Instructor",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                    Chip(
                      label: Text(
                        "Martial Artist",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                    Chip(
                      label: Text(
                        "Kung-Fu Master",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                    Chip(
                      label: Text(
                        "Boxer",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                    Chip(
                      label: Text(
                        "Ninja",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              //Container for clients
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Clients",
                      style:
                          TextStyle(color: Colors.grey.shade100, fontSize: 24),
                    ),
                    Text(
                      "All the people who are currently under your supervision",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              //Container for Clients List

              Container(
                width: MediaQuery.of(context).size.width - 16,
                padding: EdgeInsets.only(left: 16),
                height: 60,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/client${index + 1}.jpg",
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
