import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:homepage/apis/thirtparty/github.dart';
import 'package:homepage/apis/thirtparty/github/github_models.dart';
import 'package:homepage/components/repo_card.dart';
import 'package:x_common/adaptive/adaptive.dart';

const List<NavigationDestination> destinations = <NavigationDestination>[
  NavigationDestination(
    label: 'Repos',
    icon: Icon(Icons.dashboard),
  ),
  NavigationDestination(
    label: 'Articles',
    icon: Icon(Icons.article_outlined),
  ),
  NavigationDestination(
    label: 'Chat',
    icon: Icon(Icons.chat_bubble_outline),
  ),
  NavigationDestination(
    label: 'Video',
    icon: Icon(Icons.video_call_outlined),
  )
];

final Widget trailingNavRail = Column(
  children: <Widget>[
    const Divider(color: Colors.black),
    const SizedBox(height: 10),
    const Row(
      children: <Widget>[
        SizedBox(width: 27),
        Text('Folders', style: TextStyle(fontSize: 16)),
      ],
    ),
    const SizedBox(height: 10),
    Row(
      children: <Widget>[
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder_copy_outlined),
          iconSize: 21,
        ),
        const SizedBox(width: 21),
        const Flexible(
          child: Text(
            'Freelance',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: <Widget>[
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder_copy_outlined),
          iconSize: 21,
        ),
        const SizedBox(width: 21),
        const Flexible(
          child: Text(
            'Mortgage',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: <Widget>[
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder_copy_outlined),
          iconSize: 21,
        ),
        const SizedBox(width: 21),
        const Flexible(
          child: Text('Taxes', overflow: TextOverflow.ellipsis),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: <Widget>[
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder_copy_outlined),
          iconSize: 21,
        ),
        const SizedBox(width: 21),
        const Flexible(
          child: Text('Receipts', overflow: TextOverflow.ellipsis),
        ),
      ],
    ),
  ],
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Repository> _repos = [];
  int selectedNavigation = 0;

  Future<void> _loadRepos() async {
    final repos = await getOwnRepositories('kuloud');
    if (repos != null) {
      setState(() {
        _repos = repos;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadRepos();
  }

  @override
  Widget build(BuildContext context) {
    final NavigationRailThemeData navRailTheme =
        Theme.of(context).navigationRailTheme;
    return Scaffold(
      body: AdaptiveLayout(
        transitionDuration: Durations.medium1,
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.medium: SlotLayout.from(
              inAnimation: AdaptiveScaffold.leftOutIn,
              outAnimation: AdaptiveScaffold.leftInOut,
              duration: Durations.medium1,
              key: const Key('Primary Navigation Medium'),
              builder: (_) => AdaptiveScaffold.standardNavigationRail(
                selectedIndex: selectedNavigation,
                onDestinationSelected: (int newIndex) {
                  setState(() {
                    selectedNavigation = newIndex;
                  });
                },
                leading: const Icon(Icons.menu),
                destinations: destinations
                    .map((NavigationDestination destination) =>
                        AdaptiveScaffold.toRailDestination(destination))
                    .toList(),
                backgroundColor: navRailTheme.backgroundColor,
                selectedIconTheme: navRailTheme.selectedIconTheme,
                unselectedIconTheme: navRailTheme.unselectedIconTheme,
                selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
              ),
            ),
            Breakpoints.large: SlotLayout.from(
              key: const Key('Primary Navigation Large'),
              inAnimation: AdaptiveScaffold.leftOutIn,
              outAnimation: AdaptiveScaffold.leftInOut,
              duration: Durations.medium1,
              builder: (_) => AdaptiveScaffold.standardNavigationRail(
                selectedIndex: selectedNavigation,
                onDestinationSelected: (int newIndex) {
                  setState(() {
                    selectedNavigation = newIndex;
                  });
                },
                extended: true,
                leading: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'REPLY',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 201, 197)),
                    ),
                    Icon(Icons.menu_open)
                  ],
                ),
                destinations: destinations
                    .map((NavigationDestination destination) =>
                        AdaptiveScaffold.toRailDestination(destination))
                    .toList(),
                trailing: trailingNavRail,
                backgroundColor: navRailTheme.backgroundColor,
                selectedIconTheme: navRailTheme.selectedIconTheme,
                unselectedIconTheme: navRailTheme.unselectedIconTheme,
                selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
              ),
            ),
          },
        ),
        // Body switches between a ListView and a GridView from small to medium
        // breakpoints and onwards.
        body: _repos.isNotEmpty
            ? SlotLayout(
                config: <Breakpoint, SlotLayoutConfig>{
                  Breakpoints.small: SlotLayout.from(
                    key: const Key('Body Small'),
                    builder: (_) => ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kMaterialCompactMinMargin),
                      itemCount: _repos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RepositoryCard(
                            key: Key('${_repos[index].id}'),
                            repository: _repos[index]);
                      },
                    ),
                  ),
                  Breakpoints.mediumAndUp: SlotLayout.from(
                    key: const Key('Body Medium'),
                    builder: (_) =>
                        LayoutBuilder(builder: (context, constraints) {
                      final crossAxisCount =
                          adaptesGridCrossAxisCount(constraints);
                      return GridView.count(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kMaterialMediumMinMargin),
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: 1.5,
                          mainAxisSpacing: kMaterialMediumMinMargin,
                          crossAxisSpacing: kMaterialMediumMinMargin,
                          children: _repos
                              .map((r) => RepositoryCard(
                                  key: Key('${r.id}'), repository: r))
                              .toList());
                    }),
                  ),
                },
              )
            : null,
        // BottomNavigation is only active in small views defined as under 600 dp
        // width.
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('Bottom Navigation Small'),
              inAnimation: AdaptiveScaffold.bottomToTop,
              outAnimation: AdaptiveScaffold.topToBottom,
              duration: Durations.medium1,
              builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                destinations: destinations,
                currentIndex: selectedNavigation,
                onDestinationSelected: (int newIndex) {
                  setState(() {
                    selectedNavigation = newIndex;
                  });
                },
              ),
            )
          },
        ),
      ),
    );
  }
}
