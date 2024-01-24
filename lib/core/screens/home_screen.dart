import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:facebook_clone/core/constants/constants.dart';
import 'package:facebook_clone/core/screens/search_view.dart';
import 'package:facebook_clone/core/widgets/round_icon_button.dart';
import 'package:facebook_clone/features/chat/presentation/screens/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:facebook_clone/core/screens/search_screen.dart';
import 'package:facebook_clone/features/chat/presentation/screens/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          title: _buildFacebookText(),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.blue),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchView(),
                );
              },
            ),
            // _buildSearchWidget(),
            _buildMessengerWidget(),
          ],
          bottom: TabBar(
            tabs: Constants.getHomeScreenTabs(_tabController.index),
            controller: _tabController,
            onTap: (index) {
              setState(() {});
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: Constants.screens,
        ),
      ),
    );
  }

  Widget _buildFacebookText() => const Text(
        'facebook Clone',
        style: TextStyle(
          color: Color.fromARGB(255, 55, 138, 247),
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      );

  // Widget _buildSearchWidget() => const RoundIconButton(
  //       icon: FontAwesomeIcons.magnifyingGlass,
  //     );

  Widget _buildMessengerWidget() => InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ChatsScreen.routeName);
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: FaIcon(
            FontAwesomeIcons.facebookMessenger,
            color: AppColors.blueColor,
          ),
        ),
      );
}
