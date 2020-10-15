import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/constants/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SpecificPage extends StatefulWidget {
  final String image, name, description, location;
  final int price;
  final double rating;

  const SpecificPage(
      {Key key,
      this.image,
      this.name,
      this.description,
      this.price,
      this.rating,
      this.location})
      : super(key: key);
  @override
  _SpecificPageState createState() => _SpecificPageState();
}

class _SpecificPageState extends State<SpecificPage> {
  IconData icon = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          )),
          Align(
            alignment: Alignment(0, -0.95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: kTextColor,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                IconButton(
                    icon: Icon(icon, color: Colors.red, size: 35),
                    onPressed: () {
                      setState(() {
                        if (icon == Icons.favorite) {
                          icon = Icons.favorite_border;
                        } else {
                          icon = Icons.favorite;
                        }
                      });
                    })
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, 0.2),
            child: Container(
              height: size.width * 0.95,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black,
                    ],
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset("assets/icons/homes.svg")),
                    title: Text(widget.name.toUpperCase() + "\n",
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 40)),
                  ),
                  Spacer(),
                  Text(
                    widget.description + "\n",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kTextColor,
                        ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      labels(
                          size, Icons.shopping_basket, "\$ " + widget.price.toString(), "Price"),
                      labels(size, Icons.watch, "2 Hours", "Drive")
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 2.0, left: 5.0, right: 8.0),
                    child: Row(
                      children: [
                        SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {},
                            starCount: 5,
                            rating: widget.rating,
                            size: 25.0,
                            isReadOnly: true,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            color: Colors.orange,
                            spacing: 0.0),
                        Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: actionColor),
                          child: Center(
                              child: Text(widget.rating.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20))),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 80,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: actionColor),
                child: IconButton(
                  icon: SvgPicture.asset("assets/icons/more.svg"),
                  onPressed: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget labels(size, icon, text, subtext) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: kBackgroundColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 15,
            color: Colors.black,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: text.toString().replaceAllMapped(
                        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 22,
                          color: kTextColor,
                        )),
                TextSpan(
                    text: "\n$subtext",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 18,
                          color: kPrimaryColor,
                        )),
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    Key key,
    this.image,
    this.width,
    this.height,
  }) : super(key: key);
  final String image;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
