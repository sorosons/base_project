import 'package:internet_connection_checker/internet_connection_checker.dart';

main() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if (result == true) {
    print('YAY! Free cute dog pics!');
  } else {
    print('No internet :( Reason:');
    print(InternetConnectionChecker().hasConnection);
  }
}
