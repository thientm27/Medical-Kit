import 'package:flutter/material.dart';
import 'src/features/screens/on_boarding_screen.dart';

void main() 
  => runApp(const App());


class App extends StatelessWidget {
  const App({Key? key}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => const OnBoardingScreen(), // Map the route to your default page widget
        // Define other routes here if needed
      },
    );
  }
}
