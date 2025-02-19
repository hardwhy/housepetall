/// This aim to make the routes more readable and manageable
/// Since this app contains only one feature, so it's not necessary to create a new file for the routes
/// But if the app contains multiple features, it's better to create a new file or for better consistency, make another package for if it has more functionality in it
class ReviewRoutes {
  const ReviewRoutes();

  static const String root = '/review';
  static const String detail = '$root/detail';
  static const String submit = '$root/submit';
}
