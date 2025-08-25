enum LicenseType {
  cc0('CC0', 'https://creativecommons.org/public-domain/cc0/'),
  ccBySa30('CC BY-SA 3.0', 'https://creativecommons.org/licenses/by-sa/3.0/');

  const LicenseType(this.name, this.url);
  final String name;
  final String url;
}
