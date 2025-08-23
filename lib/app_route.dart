enum AppRoute {
  mainMenu('/'),
  gameplay('/gameplay');

  const AppRoute(this.path);
  final String path;
}
