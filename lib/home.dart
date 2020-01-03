import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:works/src/categorias/construccion.dart';



class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<HomePage>{
  final _formKey = GlobalKey<FormState>();
  int _current = 0;


  @override
  Widget build(BuildContext context) {
    final post = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
            ),
            minWidth: 500.0,
            height: 42.0,
            onPressed: () {
              Navigator.of(context).pushNamed('/publicacion-page');
            },
            color: Colors.lightBlueAccent,
            child: Text('Crear una Publicación', style: TextStyle(color: Colors.white))
        ),
      ),
    );

    final List<String> imgList = [
      'https://www.familyhandyman.com/wp-content/uploads/2018/12/FH14SEP_ADVGAR_01-2-150x150.jpg',
      'http://www.jamaicaobserver.com/apps/pbcsi.dll/storyimage/JO/20181115/ARTICLE/181119813/AR/0/AR-181119813.jpg&maxh=332&maxw=504',
      'https://baywoodplumbingandgas.files.wordpress.com/2019/07/3-plumbing-jobs-you-should-leave-to-the-experts.jpg?w=300',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8upBOWVWaMIGqAUmRIdcRIpVz5VRaeOGyjWVdH45hJp-Ww8Oa&s',
      'https://www.ferro.com/-/media/images/product-category/electronic-materials/product-family/family_electronic-glass-materials_300x150.jpg'
    ];

    List<T> map<T>(List list, Function handler) {

      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }

      return result;
    }

    final List child = map<Widget>(
      imgList,
          (index, i) {

        if(index == 0){
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new ConstruccionPage(),
                ),
              );            },
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
                          colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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
        if(index == 1){
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
                        colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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
        if(index == 2){
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
                        colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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
        if(index == 3){
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
                        colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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
        if(index == 4){
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
                        colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

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

    final body =
    ListView(
      children:<Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Column(children: <Widget>[
            manualCarouselDemo,
          ],),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(28.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white,
                Colors.white
              ]),
            ),
            child: Column(
              children: <Widget>[
                post,
              ],
            ),
        ),
      ]

    );
    //Manually operated Carousel


    return Scaffold(
      appBar: AppBar(
        title: const Text('Works'),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
              onTap: () => Navigator.of(context).pushNamed('/perfil-page'),

              child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: const Icon(Icons.account_circle))),

        ],
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                Navigator.of(context).pushNamed('/perfil-page');
              },
              leading: Icon(
                  Icons.account_circle
              ),
            ),
            ListTile(
              title: Text('Solicitudes'),
              onTap: () {
                Navigator.of(context).pushNamed('/solicitudes-page');
              },
              leading: Icon(
                  Icons.reorder
              ),
            ),
            ListTile(
              title: Text('Pago'),
              onTap: () {
                Navigator.of(context).pushNamed('/pago-page');
              },
              leading: Icon(
                  Icons.payment
              ),
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                Navigator.of(context).pushNamed('/configuracion-page');
              },
              leading: Icon(
                  Icons.settings
              ),
            ),
            ListTile(
              title: Text('Ayuda'),
              onTap: () {
                Navigator.of(context).pushNamed('/ayuda-page');
              },
              leading: Icon(
                  Icons.help
              ),
            )
          ],
        ),
      ),

    );
  }
}
