
import 'package:get/get.dart';

class AppTranslations extends Translations{
  @override
  Map<String,Map<String,String>> get keys =>{
    'en_US': {
      'hello': 'Hello World',
      'Language' : 'Language',
      'English' : 'English',
      'Khmer' : 'Khmer'
    },
    'km_KH': {
      'hello': 'សួរស្តី',
      'Language' : 'ភាសារ',
      'English' : 'អង់គ្លេស',
      'Khmer' : 'ខ្មែរ'
    }
  };
}