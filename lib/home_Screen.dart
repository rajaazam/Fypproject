import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List itemlist = [
  {
    "image": "asset/e1.webp",
    "name": "Deosai National Park",
    "Description":
        " It shows the French model Kiki de Montparnasse from the back, nude to below her waist and wearing a turban. Two f-holes are painted on her back to make her body resemble a violin."
  },
  {
    "image": "asset/e2.webp",
    "name": "Katpana Lake",
    "Description":
        "SZ asked the ICIJ for help because of the amount of data involved. Journalists from 107 media organizations in 80 countries analyzed documents detailing the operations of the law firm"
  },
  {
    "image": "asset/e3.jpg",
    "name": "Shangrila Lake",
    "Description":
        "The documents were dubbed the Panama Papers because of the country they were leaked from, but the Panamanian government expressed strong objections to the name over concerns that it would tarnish the government's and country's image worldwide, as did other entities "
  },
  {
    "image": "asset/e4.avif",
    "name": "Khaplu Fort",
    "Description":
        "The journalists on the investigative team found business transactions by many important figures in world politics, sports, and art. While many of the transactions were legal, since the data is incomplete, questions remain in"
  },
  {
    "image": "asset/e5.jpg",
    "name": "Hunza Valley",
    "Description":
        ". The program employs panelists who guess the celebrities' identities. In most episodes, after the last performance, a vote of the panelists and the audience eliminates a contestant "
  },
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: SizedBox(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.5,
                    crossAxisCount: 1),
                itemCount: itemlist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 45),
                                child: Image.network(
                                  itemlist[index]["image"],
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                ),
                              ),
                              Positioned(
                                  top: -7,
                                  left: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              itemlist[index]["name"],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
