import 'package:flutter/material.dart';

import '../pages/about_page.dart';
import '../pages/tv_list_page.dart';
import '../pages/watchlist_movies_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              _go(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('Tv Series'),
            onTap: () {
              _go(context, TvListPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist'),
            onTap: () {
              _go(context, WatchlistMoviesPage.routeName);
            },
          ),
          ListTile(
            onTap: () {
              _go(context, AboutPage.routeName);
            },
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
          ),
        ],
      ),
    );
  }

  void _go(BuildContext context, String routeName) {
    if (ModalRoute.of(context)?.settings.name == routeName) {
      Navigator.pop(context);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }
}
