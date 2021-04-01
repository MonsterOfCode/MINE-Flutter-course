import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade600,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Text(
                "TODOS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              top: 20,
              left: 20,
            ),
            Center(
              child: Container(
                width: 400,
                height: 600,
                child: Image.asset(
                  "assets/image.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: 0.85,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)),
                      ),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              "Task No $index",
                              style: TextStyle(
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "This is the detail of task no $index",
                              style: TextStyle(color: Colors.green.shade900),
                            ),
                            trailing: Icon(
                              Icons.check_circle,
                              color: Colors.greenAccent,
                            ),
                          );
                        },
                        controller: scrollController,
                        itemCount: 20,
                      ),
                    ),
                    Positioned(
                      top: -10,
                      right: 40,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.pinkAccent,
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
