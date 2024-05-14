import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

//notlar bcgrouncolor düzenlenecek controller verilecek ve onchanged düzenlenecek on submit callback verilecek

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.hintText});
  final String hintText;
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();

  IconData _icon = Icons.search;
  // Arama çubuğuna tıklandığında gerçekleşecek işlemler.
  void _onTap() {
    setState(() {
      _icon = Icons.arrow_back;
    });
  }

  void _onLeadingIconButtonPressed() {
    // Dismiss the keyboard when the leading icon is tapped
    _controller.clear();
    setState(() {
      _icon = Icons.search;
    });
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _controller,

      hintText: widget.hintText,
      textStyle: MaterialStateProperty.all<TextStyle>(
          Theme.of(context).textTheme.bodyLarge!),
      leading: IconButton(
          onPressed: _onLeadingIconButtonPressed,
          icon: Icon(_icon, color: ColorsProject.apricotSorbet)),

      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade100),
      onChanged: (String text) {
        // Kullanıcının girdiği metne göre arama işlemini gerçekleştirin.
        _onTap();
        if (text.isEmpty) {
          setState(() {
            _icon = Icons.search;
          });
        }
      },

      //  backgroundColor: , daha sonra düzelt
      onTap: () {
        _onTap();
        // Arama çubuğuna tıklandığında gerçekleşecek işlemler.
      },
      onSubmitted: (String text) {
        // Arama sorgusu gönderildi.
      },
    );
  }
}




// class MyDelegate extends SearchDelegate {
//   final CityWeatherService _cityWeatherService = CityWeatherService(
//       apiKey: ProjectApi().getWeatherApi,
//       baseUrl: "https://api.openweathermap.org/data/2.5");

//   //? şehir isimlerini db mi yapalım uygulama içinde yoksa api mi kullanalım?
//   List<String> searchResult = Searchresult;
//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//         IconButton(
//           onPressed: () => query = "",
//           icon: const Icon(Icons.clear),
//         )
//       ];

//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//         onPressed: () => close(context, null),
//         icon: const Icon(Icons.arrow_back_ios_outlined),
//       );

//   @override
//   Widget buildResults(BuildContext context) {
//     // FutureBuilder kullanarak asenkron veri çekme işlemi
//     return FutureBuilder<WeatherModel?>(
//       future: _cityWeatherService.getCityWeatherData(query),
//       builder: (BuildContext context, AsyncSnapshot<WeatherModel?> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Hata: ${snapshot.error}'));
//         } else {
//           // Veri çekme işlemi başarılı olduysa, veriyi göster
//           WeatherModel? weatherData = snapshot.data;
//           return weatherData == null
//               ? const Center(child: Text(""))
//               : Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ListTile(
//                           title: Center(
//                               child: Text(weatherData.cityName ?? "Unknown")),
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.thermostat_outlined),
//                           title: const Text("Sıcaklık"),
//                           trailing: Text("${weatherData.temp}"),
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.cloud),
//                           title: const Text("Durum"),
//                           trailing: Text("${weatherData.mainCondition}"),
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.air),
//                           title: const Text("Rüzgar"),
//                           trailing: Text("${weatherData.wind}"),
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.water_damage),
//                           title: const Text("Nem"),
//                           trailing: Text("${weatherData.humidity}"),
//                         ),
//                         ListTile(
//                           leading: const Icon(Icons.umbrella),
//                           title: const Text("Yağmur Oranı"),
//                           trailing: Text("${weatherData.rain ?? 0.0}"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//         }
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> cityname =
//         Searchresult.where((element) => element.startsWith(query)).toList();

//     return ListView.builder(
//       itemCount: cityname.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           onTap: () {
//             query = cityname[index];
//             showResults(context); // Add this line
//           },
//           title: Text(cityname[index]),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

// class CustomSearchBar extends StatefulWidget {
//   const CustomSearchBar({super.key, required this.hintText});

//   final String hintText;

//   @override
//   State<CustomSearchBar> createState() => _CustomSearchBarState();
// }

// class _CustomSearchBarState extends State<CustomSearchBar> {
//   IconData _icon = Icons.search;
//   final TextEditingController _controller = TextEditingController();
//   void _onLeadingIconButtonPressed() {
//     // Dismiss the keyboard when the leading icon is tapped
//     _controller.clear();
//     setState(() {
//       _icon = Icons.search;
//     });
//     FocusScope.of(context).unfocus();
//   }

//   void _onSearchChanged(String text) {
//     // Perform search operation based on the entered text
//     // You can call a separate search function here
//     print("Search term: $text");
//     if (text.isEmpty) {
//       setState(() {
//         _icon = Icons.search;
//       });
//     } else {
//       setState(() {
//         _icon = Icons.arrow_back;
//       });
//     }
//   }

//   void _onSubmit(String text) {
//     // Handle search submission here
//     // You can call a separate function to submit the search query
//     print("Search submitted: $text");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: ColorsProject.apricotSorbet.withOpacity(0.2),
//       ),
//       child: TextField(
//         controller: _controller,
//         decoration: InputDecoration(
//           hintText: widget.hintText,
//           prefixIcon: IconButton(
//             onPressed: _onLeadingIconButtonPressed,
//             icon: Icon(_icon, color: ColorsProject.apricotSorbet),
//           ),
//           contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(
//               color: Colors.transparent,
//             ),
//           ),
//         ),
//         onChanged: _onSearchChanged,
//         onSubmitted: _onSubmit,
//       ),
//     );
//   }
// }
