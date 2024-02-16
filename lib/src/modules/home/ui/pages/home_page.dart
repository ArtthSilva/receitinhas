import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
   late TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SafeArea(
        child: Stack(children: [
          Align(
            alignment: const Alignment(-0.75, -0.85),
            child: InkWell(
              child: Image.asset('assets/images/menu_icon.png'),
              onTap: () => ZoomDrawer.of(context)!.toggle(),
            ),
          ),
          Align(
              alignment: const Alignment(0.9, -0.9),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                  ))),
          Align(
            alignment: const Alignment(-0.65, -0.7),
            child: Text(
              'Delicious',
              style: GoogleFonts.balooTamma2(
                fontWeight: FontWeight.w700,
                fontSize: 34,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.55, -0.6),
            child: Text(
              'food for you',
              style: GoogleFonts.balooTamma2(
                fontWeight: FontWeight.w700,
                fontSize: 34,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.35),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SearchBar(
                backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                leading: const Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.of(context).size.height / 1.8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: const Color.fromARGB(234, 255, 84, 68),
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.only( bottom: 5),
                          child: Text(
                            'Foods',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),Padding(
                          padding: EdgeInsets.only(right: 12.0, bottom: 5),
                          child: Text(
                            'Drinks',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),Padding(
                          padding: EdgeInsets.only(right: 12.0, bottom: 5),
                          child: Text(
                            'Snacks',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, bottom: 5),
                          child: Text(
                            'Frutas',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(color: Colors.red,),
                      Container(color: Colors.green,),
                      Container(color: Colors.blue,),
                      Container(color: Colors.orange,),
                    ],
                  ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
