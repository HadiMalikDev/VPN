import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('s', ()async{
    print(Directory.current);
    File file=File('lib/services/USA.ovpn');
    print(await file.exists());
    print(await file.readAsString());
  });
}