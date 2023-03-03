<h1 align="center">
  TuanisSidebar
</h1>

<h2 align="center">Flutter package to create sidebars specially for web, but can be integrated as a drawer in a mobile app. Allows nested items.</h2>


|Desktop|Mobile|
|---|---|
|![screenshot](https://github.com/ebreness/tuanis_sidebar/blob/main/doc/desktop.gif?raw=true "Desktop")|![screenshot](https://github.com/ebreness/tuanis_sidebar/blob/main/doc/mobile.gif?raw=true "Mobile")|

## Basic Example
```dart
return Scaffold(
  body: Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TuanisSidebar(
        selectedColor: Colors.white,
        selectedTileColor: Colors.blue,
        selectedItemId: 'settings',
        sections: const [
          TuanisSidebarSection(
            title: Text(
              'MAIN',
              style: TextStyle(letterSpacing: 1.2),
            ),
            items: [
              TuanisSidebarItem(
                id: 'dashboard',
                tile: ListTile(
                  leading: Icon(Icons.dashboard),
                  title: Text('Dashboard'),
                ),
                items: [
                  TuanisSidebarItem(
                    id: 'dashboard_1',
                    tile: ListTile(
                      leading: Icon(Icons.abc),
                      title: Text('Child of Dashboard'),
                    ),
                  )
                ],
              ),
              TuanisSidebarItem(
                id: 'settings',
                tile: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                ),
              )
            ],
          ),
          TuanisSidebarSection(
            borderColor: Color(0xffcbd5e1),
            items: [
              TuanisSidebarItem(
                id: 'logout',
                tile: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              )
            ],
          ),
        ],
      ),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(50),
          color: Colors.white,
          child: const Text('App body here'),
        ),
      )
    ],
  ),
);
```
