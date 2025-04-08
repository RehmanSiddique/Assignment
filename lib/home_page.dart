import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:animations/animations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Personal',
        'files': 30,
        'size': '56 MBs',
        'icon': LucideIcons.bookOpen
      },
      {
        'title': 'Academic',
        'files': 102,
        'size': '2.26 GB',
        'icon': LucideIcons.book
      },
      {
        'title': 'Work',
        'files': 300,
        'size': '1.57 GB',
        'icon': LucideIcons.briefcase
      },
      {
        'title': 'Others',
        'files': 201,
        'size': '1.02 GB',
        'icon': LucideIcons.folder
      },
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome, Rehman!",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600])),
                        SizedBox(height: 5),
                        Text("Note-Taking App",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications_active_outlined,
                          color: Colors.grey[700]),
                      SizedBox(width: 20),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/Profile.jpg"),
                        radius: 25,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 25),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 160,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 207, 195, 227)
                          .withOpacity(0.6),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 150,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.deepPurple.withOpacity(0.3),
                    ),
                  ),
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      color: Color(0xFF7C4DFF),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.5),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(40),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15)),
                            // padding: EdgeInsets.all(10),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 40,
                                backgroundImage: AssetImage(
                                  "assets/pie.png",
                                ))
                            // Icon(Icons.pie_chart,
                            //     size: 40, color: Colors.white),
                            ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Available Space",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                )),
                            Text("20.254 GB of 25 GB Used",
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return OpenContainer(
                      // closedColor: const Color.fromARGB(179, 255, 255, 255),
                      // openColor: Colors.white,
                      transitionDuration: Duration(milliseconds: 500),
                      closedBuilder: (context, openContainer) =>
                          GestureDetector(
                        onTap: openContainer,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 236, 231, 247),
                                radius: 30,
                                child: Icon(category['icon'] as IconData?,
                                    color: Colors.deepPurple, size: 30),
                              ),
                              Spacer(),
                              Text("${category['title']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                              Text("${category['files']} Files",
                                  style: TextStyle(color: Colors.grey[600])),
                              Text("Size: ${category['size']}",
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                      openBuilder: (context, _) => Scaffold(
                        appBar:
                            AppBar(title: Text("${category['title']} Files")),
                        body: Center(
                            child: Text("Files for ${category['title']}")),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF7C4DFF),
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 20,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu_book_outlined, color: Colors.black),
              Icon(Icons.view_list_outlined, color: Colors.black),
              SizedBox(width: 40),
              Icon(Icons.lightbulb_outline, color: Colors.black),
              Icon(Icons.settings_outlined, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
