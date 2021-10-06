import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 754,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFEFCD4),
                            Color(0xFFCDD5F7),
                            Color(0xFFFEFCD4),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        TopNavBar(),
                        Divider(height: 2, color: Colors.black54),
                        const SizedBox(height: 50),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(22.0),
                          child: Container(
                            width: 300,
                            color: Colors.white.withOpacity(0.4),
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.white.withOpacity(0.2),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    // horizontal: 20.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomButton(
                                        title: "Swap",
                                        onTap: () {
                                          setState(() {
                                            currentIndex = 0;
                                          });
                                        },
                                        isSelected: currentIndex == 0,
                                      ),
                                      CustomButton(
                                        title: "Buy/Sell",
                                        onTap: () {
                                          setState(() {
                                            currentIndex = 1;
                                          });
                                        },
                                        isSelected: currentIndex == 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    children: [
                                      YouSend(),
                                      const SizedBox(height: 15),
                                      RotatedBox(
                                        quarterTurns: 1,
                                        child: Container(
                                          padding: EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFD0DAFB),
                                          ),
                                          child: Icon(Icons.swap_horiz,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      YouGet(),
                                      const SizedBox(height: 30),
                                      SizedBox(
                                        height: 32,
                                        width: 150,
                                        child: CustomButton(
                                          title: "Swap Now",
                                          onTap: () {},
                                          isSelected: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

class YouSend extends StatelessWidget {
  const YouSend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "You Send",
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Balance:40ETH",
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0.0",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "ETH",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class YouGet extends StatelessWidget {
  const YouGet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "You Get",
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0.0",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "BTC",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Colors.black : Colors.transparent,
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20.0,
        ),
        // color: Colors.blue,
        constraints: BoxConstraints(
          maxWidth: 1280,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.purple,
            ),
            Spacer(),
            NavList(),
            Spacer(),
            NavButtonAndIconButton(),
          ],
        ),
      ),
    );
  }
}

class NavList extends StatelessWidget {
  const NavList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavItem(
          onTap: () {},
          title: "Trader",
        ),
        NavItem(
          onTap: () {},
          title: "Miner",
        ),
        NavItem(
          onTap: () {},
          title: "Farmer",
        ),
        NavItem(
          onTap: () {},
          title: "Charts",
        ),
      ],
    );
  }
}

class NavButtonAndIconButton extends StatelessWidget {
  const NavButtonAndIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16.0),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "Connect Wallet",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Material(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Material(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
