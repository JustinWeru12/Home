import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/constants/constants.dart';
import 'package:home/constants/navBar.dart';
import 'package:home/pages/specific.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            SingleChildScrollView(
              child: Container(
                  // height: size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      kPrimaryColor.withOpacity(0.7),
                      kSecondaryColor,
                      Colors.transparent
                    ],
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      search(size),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Home",
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: "CallingAngels",
                              fontSize: 40),
                        ),
                      ),
                      Text(
                        "The best investment on Earth is Earth",
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "HelveticaNeueCyr",
                            fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            HouseCard(
                                image: "assets/images/1.jpg",
                                name: "Villa",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 250000),
                            HouseCard(
                                image: "assets/images/2.jpg",
                                name: "Loft",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 250000),
                            HouseCard(
                                image: "assets/images/3.jpg",
                                name: "Flat",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 350000),
                            HouseCard(
                                image: "assets/images/4.jpg",
                                name: "Apartment",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 258000),
                            HouseCard(
                                image: "assets/images/5.jpg",
                                name: "Villa",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 255000),
                            HouseCard(
                                image: "assets/images/6.jpg",
                                name: "Villa",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 550000),
                            HouseCard(
                                image: "assets/images/7.jpg",
                                name: "Villa",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 355000),
                            HouseCard(
                                image: "assets/images/8.jpg",
                                name: "Villa",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 255000),
                            HouseCard(
                                image: "assets/images/9.jpg",
                                name: "Villa",
                                description:
                                    "Modern Home with a feng shui feel and flat expansive roofs, large windows, wooden-like cladding and stone finishings combined with quality interior finishes that raise the standard of modern living in a urban location. ",
                                location: "Nairobi, Kenya",
                                rating: 4.5,
                                price: 258000),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  )),
            ),
            Align(alignment: Alignment.bottomCenter, child: MyBottomNavBar()),
          ],
        ),
      ),
    );
  }

  Widget search(size) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          width: size.width * 0.75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ],
          ),
          child: TextField(
            style: TextStyle(color: kPrimaryColor),
            autofocus: false,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                fontSize: 20,
                color: kPrimaryColor.withOpacity(0.5),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                size: 30,
                color: kBackgroundColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.transparent,
                // border: Border.all(color: kBackgroundColor),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/icons/icon.png"))),
          ),
        ),
      ],
    );
  }
}

class HouseCard extends StatelessWidget {
  const HouseCard(
      {Key key,
      this.image,
      this.name,
      this.description,
      this.rating,
      this.price, this.location})
      : super(key: key);

  final String image, name, description, location;
  final double rating;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SpecificPage(
                      image: image,
                      name: name,
                      description: description,
                      price: price,
                      rating: rating,
                      location: location
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: size.width * 0.5,
          height: size.width * 0.75,
          decoration: BoxDecoration(
            color: kTertiaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  child: Image.asset(
                    image,
                    height: size.width * 0.5,
                    width: size.width * 0.75,
                    fit: BoxFit.cover,
                  )),
              Container(
                width: size.width * 0.5,
                height: size.width * 0.75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          kTertiaryColor.withOpacity(0.5),
                          kTertiaryColor
                        ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "$name\t\t\t\t\t\t\t\t\t\t\t\t\$$price\n"
                                  .toUpperCase(),
                              style: Theme.of(context).textTheme.button),
                          TextSpan(
                            text: "$description",
                            style: TextStyle(
                              color: kBackgroundColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 2.0, left: 5.0, right: 8.0),
                      child: Row(
                        children: [
                          SmoothStarRating(
                              allowHalfRating: false,
                              onRated: (v) {},
                              starCount: 5,
                              rating: rating,
                              size: 25.0,
                              isReadOnly: true,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              color: Colors.orange,
                              spacing: 0.0),
                          Spacer(),
                          Text(rating.toString(),
                              style: Theme.of(context).textTheme.button),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  final String image, service, description;

  const Services({Key key, this.image, this.service, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Container(
        height: size.width * 0.18,
        decoration: BoxDecoration(
          color: kTertiaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: SvgPicture.asset(image),
                onPressed: () {},
              ),
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "$service\n",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: 20,
                              color: kTextColor,
                            )),
                    TextSpan(
                      text: "$description",
                      style: TextStyle(
                        color: kBackgroundColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: kBackgroundColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
