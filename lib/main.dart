import 'package:flutter/material.dart';
import 'package:search_page/model/move_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MoveModel> listMoveModel = [
    MoveModel(
        moveTile: 'Wolf Hound',
        moveYear: 2022,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY212bUVtVG12TkVtdWNtRVBtVFlUWWJL.jpg',
        moverRating: 7.8),
    MoveModel(
        moveTile: 'Young Justice',
        moveYear: 2010,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY21tbUVtam1URW1ibUVFY21FdmNQbG1wYm1ibA.jpg',
        moverRating: 8.7),
    MoveModel(
        moveTile: 'Wolf',
        moveYear: 1994,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY21UWWptYnZjRWNtVHZteGpjd2xtam16.jpg',
        moverRating: 6.3),
    MoveModel(
        moveTile: 'Wolf Creek',
        moveYear: 2005,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY21ZcG1tZWNtdmNORW1ZRW1ITmc.jpg',
        moverRating: 6.3),
    MoveModel(
        moveTile: 'Hacks ',
        moveYear: 2021,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY21ZanZOam1Udm1hY2NOYm1qY056eG1keg.jpg',
        moverRating: 8.2),
    MoveModel(
        moveTile: 'Blood Creek',
        moveYear: 2009,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY21UVG1tcHZtdkVjbUVjd3hhbUd3eHg.jpg',
        moverRating: 5.3),
    MoveModel(
        moveTile: 'Captain Blood',
        moveYear: 1935,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY21Udm12bUV2TnZFY1BtWVRqbW1tbW1tUA.jpg',
        moverRating: 7.8),
    MoveModel(
        moveTile: 'Wolf Hound',
        moveYear: 1985,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY3ZjdmNtWXBqRWNtYnh4bWptVGJtWXo.jpg',
        moverRating: 6.5),
    MoveModel(
        moveTile: 'Rambo III',
        moveYear: 1988,
        moveUri:
            'https://i.egycdn.com/pic/WmFwZndlY3ZjdmNtWW9SY21FbUlQbW1hd1RFUA.jpg',
        moverRating: 5.8),
  ];
  List<MoveModel> displayList = List.from(listMoveModel);

  void updateValue(String value) {
    setState(() {
      displayList = listMoveModel
          .where((element) =>
              element.moveTile.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1f1545),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search of Move',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => updateValue(value),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  hintText: 'eg : The Dark Knight',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xff302360),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  prefixIconColor: Colors.purple.shade900),
            ),
            Expanded(
                child: displayList.isEmpty
                    ? const Center(
                      child: Text(
                          'No Result Found for your search',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                    )
                    : ListView.builder(
                        itemCount: displayList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Text(
                              displayList[index].moveTile,
                              style: const TextStyle(

                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              displayList[index].moveYear.toString(),
                              style: const TextStyle(
                                color: Colors.white60,
                              ),
                            ),
                            trailing: Text(
                              displayList[index].moverRating.toString(),
                              style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.purple.shade900,
                              child: Image.network(displayList[index].moveUri),
                            ),
                          );
                        })),
          ],
        ),
      ),
    );
  }
}
