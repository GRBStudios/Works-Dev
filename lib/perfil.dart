import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return ProfileView();
      }
    }

    class ProfileView extends StatefulWidget {
      @override
      _ProfileViewState createState() => _ProfileViewState();
    }

    const kExpandedHeight = 300.0;

    class _ProfileViewState extends State<ProfileView> {
      ScrollController _scrollController;

      @override
      void initState() {
        super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text("Perfil y Datos"),
                expandedHeight: kExpandedHeight,
                floating: false,
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Colors.lightGreen,
                leading: GestureDetector(
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, size: 26, color: Colors.white),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit, size: 26, color: Colors.white),
                    onPressed: () {},
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        height: 300,
                        decoration: BoxDecoration(color: Colors.lightGreen),
                        child: Center(
                          child: ProfileWidget(
                            icon: Icons.star,
                            name: "",
                            rating: "4.90",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 34,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Trabajos Realizados",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 1,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Colors.black12))),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 34,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Años",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Cuentales a los usuarios sobre ti",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {Navigator.pushNamed(context, "/datos-page");},
                        child: Container(
                            width: 200,
                            height: 60,
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: FractionalOffset.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lightGreen, width: 2),
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(const Radius.circular(4.0)),
                            ),
                            child: Text('AGREGAR DATOS',
                                style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),

              ],
            ),
          )),
    ));
  }
}

class FunctionalButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const FunctionalButton({Key key, this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  _FunctionalButtonState createState() => _FunctionalButtonState();
}

class _FunctionalButtonState extends State<FunctionalButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RawMaterialButton(
          onPressed: widget.onPressed,
          splashColor: Colors.black,
          fillColor: Colors.blue,
          elevation: 15.0,
          shape: CircleBorder(),
          child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                widget.icon,
                size: 50.0,
                color: Colors.white,
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class ProfileWidget extends StatefulWidget {
  final String name, rating;
  final IconData icon;
  final Function() onPressed;

  const ProfileWidget(
      {Key key, this.name, this.rating, this.icon, this.onPressed})
      : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "assets/user_profile.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 160,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.rating,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      widget.icon,
                      color: Colors.black,
                      size: 22,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
