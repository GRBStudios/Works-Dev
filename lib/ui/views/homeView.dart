import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:works/src/categorias/construccion.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:works/core/models/postModel.dart';
import 'package:works/core/viewmodels/CRUDModel.dart';
import 'package:works/ui/widgets/productCard.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> imgList = [
    'https://www.familyhandyman.com/wp-content/uploads/2018/12/FH14SEP_ADVGAR_01-2-150x150.jpg',
    'http://www.jamaicaobserver.com/apps/pbcsi.dll/storyimage/JO/20181115/ARTICLE/181119813/AR/0/AR-181119813.jpg&maxh=332&maxw=504',
    'https://baywoodplumbingandgas.files.wordpress.com/2019/07/3-plumbing-jobs-you-should-leave-to-the-experts.jpg?w=300',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8upBOWVWaMIGqAUmRIdcRIpVz5VRaeOGyjWVdH45hJp-Ww8Oa&s',
    'https://www.ferro.com/-/media/images/product-category/electronic-materials/product-family/family_electronic-glass-materials_300x150.jpg'
  ];
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  List<Trabajo> trabajos;

  @override
  Widget build(BuildContext context) {
    List child = map<Widget>(
      imgList,
      (index, i) {
        if (index == 0) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new ConstruccionPage(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(children: <Widget>[
                  Image.network(i, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'Construcción',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        }
        if (index == 1) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(children: <Widget>[
                Image.network(i, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'Electricidad',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
        if (index == 2) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(children: <Widget>[
                Image.network(i, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'Gasfiteria',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
        if (index == 3) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(children: <Widget>[
                Image.network(i, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'Albañilería',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
        if (index == 4) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(children: <Widget>[
                Image.network(i, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'Electrónica',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
        return null;
      },
    ).toList();
    final CarouselSlider manualCarouselDemo = CarouselSlider(
      items: child,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );
    final trabajoProvider = Provider.of<CRUDModel>(context);
    final campoBusqueda = GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/postAdd');
        },
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: TextField(
            enabled: true,
            onTap: () {
              Navigator.pushNamed(context, '/postAdd');
            },
            onChanged: (value) {
              Navigator.pushNamed(context, '/postAdd');
            },
            decoration: InputDecoration(
                hintText: "¡Solicita ayuda aquí!",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/postAdd');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
              onTap: () => Navigator.of(context).pushNamed('/perfil-page'),
              child: Padding(
                  padding: EdgeInsets.only(right: 22.0),
                  child: const Icon(Icons.account_circle))),
        ],
      ),
      body: Column(
        children: <Widget>[
          campoBusqueda,
          manualCarouselDemo,
          StreamBuilder(
              stream: trabajoProvider.fetchTrabajosAsStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  trabajos = snapshot.data.documents
                      .map((doc) => Trabajo.fromMap(doc.data, doc.documentID))
                      .toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: trabajos.length,
                      itemBuilder: (buildContext, index) =>
                          TrabajoCard(postDetails: trabajos[index]),
                    ),
                  );
                } else {
                  return Text('fetching');
                }
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                Navigator.of(context).pushNamed('/perfil-page');
              },
              leading: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text('Solicitudes'),
              onTap: () {
                Navigator.of(context).pushNamed('/solicitudes-page');
              },
              leading: Icon(Icons.reorder),
            ),
            ListTile(
              title: Text('Pago'),
              onTap: () {
                Navigator.of(context).pushNamed('/pago-page');
              },
              leading: Icon(Icons.payment),
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                Navigator.of(context).pushNamed('/configuracion-page');
              },
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('Ayuda'),
              onTap: () {
                Navigator.of(context).pushNamed('/ayuda-page');
              },
              leading: Icon(Icons.help),
            )
          ],
        ),
      ),
    );
  }
}
