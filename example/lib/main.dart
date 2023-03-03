import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/tuanis_sidebar.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    ),
  );
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TuanisSidebar(
            sectionsAligment: MainAxisAlignment.spaceBetween,
            selectedItemId: 'settings',
            sections: [
              const TuanisSidebarSection(
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
                borderColor: const Color(0xffcbd5e1),
                items: [
                  TuanisSidebarItem(
                    id: 'logout',
                    tooltip: const Text(
                      'Salir de aqui',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    tile: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        print('Logout');
                      },
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
  }
}
