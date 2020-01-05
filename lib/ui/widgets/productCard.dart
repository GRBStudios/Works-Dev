import 'package:flutter/material.dart';
import 'package:works/core/models/postModel.dart';
import 'package:works/ui/views/postDetails.dart';
import 'package:works/ui/views/homeView.dart';
import 'package:works/src/categorias/construccion.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrabajoCard extends StatelessWidget {
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

  final Trabajo postDetails;

  TrabajoCard({@required this.postDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TrabajoDetails(trabajo: postDetails)));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              elevation: 5,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.album, size: 50),
                      title: Text(
                        postDetails.titulo,
                      ),
                      subtitle: Text(
                        '${postDetails.descripcion} \$',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
