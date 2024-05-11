import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PAZARYERİ'),
          actions: [Image.asset('assets/images/notification.png')],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _searchTextfield(),
              SizedBox(
                height: 200,
                // width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  children: [
                    Image.asset('assets/images/BlackFridayPhoto.png',
                        height: 200),
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.red,
                    ),
                    Image.asset('assets/images/BlackFridayPhoto.png',
                        height: 200),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.count(
                  //soldan sağa boşluk
                  crossAxisSpacing: 2,
                  //her elemanın etrafındaki boşluk
                  mainAxisSpacing: 2,
                  //soldan sağa kaç tane
                  crossAxisCount: 2,
                  // shrinkWrap: true,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: ListTile(
                        leading: Image.asset("assets/images/Flame.png"),
                        title: const Text("Tıkla"),
                      ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Image.asset("assets/images/Flame.png"),
                      //     const SizedBox(width: 8.0),
                      //     const Text("Tıkla"),
                      //   ],
                      // ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/Flame.png"),
                          const SizedBox(width: 8.0),
                          const Text("Tıkla"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: ListTile(
                        leading: Image.asset("assets/images/Flame.png"),
                        title: const Text("Tıkla"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: ListTile(
                        leading: Image.asset("assets/images/Flame.png"),
                        title: const Text("Tıkla"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  TextField _searchTextfield() {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Search",
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
