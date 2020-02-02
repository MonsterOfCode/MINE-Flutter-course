import 'package:flutter/material.dart';
import 'package:vitual_store/screens/login_screen.dart';
import 'package:vitual_store/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

	final PageController pageController;

	CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

	  Widget _buildBackGround() => Container(
		  decoration: BoxDecoration(
			  gradient: LinearGradient(
				  colors: [
					  Color.fromARGB(255, 210, 214, 217),
					  Colors.white
				  ],
				  begin: Alignment.center,
				  end: Alignment.bottomCenter
			  )
		  ),
	  );

    return Drawer(
	    child: Stack(
		    children: <Widget>[
		    	_buildBackGround(),
			    ListView(
				    padding: EdgeInsets.only(left: 32.0, top: 16.0),
				    children: <Widget>[
				    	Container(
						    margin: EdgeInsets.only(bottom: 8.0),
						    padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
						    height: 170.0,
						    child: Stack(
							    children: <Widget>[
							    	Positioned(
									    top: 8.0,
									    left: 0.0,
									    child: Text(
										    "Flutter's\nFood",
										    style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
									    ),
								    ),
								    Positioned(
									    bottom: 0.0,
									    left: 0.0,
									    child: Column(
										    crossAxisAlignment: CrossAxisAlignment.start,
										    children: <Widget>[
										    	Text(
												    "Olá",
												    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
											    ),
											    GestureDetector(
												    child: Text(
													    "Login or SignUp",
													    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.0, fontWeight: FontWeight.bold),
												    ),
												    onTap: (){
												    	Navigator.of(context).push(
														    MaterialPageRoute(builder: (context)=>LoginScreen())
													    );
												    },
											    )
										    ],
									    ),
								    )
							    ],
						    ),
					    ),
					    Divider(),
					    DrawerTile(0, Icons.home, "Home", pageController),
					    DrawerTile(1, Icons.list, "Menu", pageController),
					    DrawerTile(2, Icons.location_on, "Restaurants", pageController),
					    DrawerTile(3, Icons.playlist_add_check, "My Orders", pageController),
				    ],
			    )
		    ],
	    ),
    );
  }
}
