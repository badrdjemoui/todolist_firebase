// استيراد مكتبة فلاتر الخاصة بتصميم الواجهة
import 'package:flutter/material.dart';
// استيراد مكتبة Firebase لتتمكن من استخدام Firebase في التطبيق
import 'package:firebase_core/firebase_core.dart';
// استيراد الشاشة التي تحتوي على قائمة المهام (TodoScreen)
import 'screens/todo_screen.dart';

// دالة main التي تبدأ تنفيذ التطبيق
void main() async {
  // التأكد من تهيئة الارتباطات مع واجهة Flutter قبل بدء التطبيق
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Firebase قبل استخدامه في التطبيق
  await Firebase.initializeApp();

  // تشغيل التطبيق بعد تهيئة Firebase
  runApp(MyApp());
}

// تعريف الكلاس MyApp الذي يوسع StatelessWidget لأن التطبيق لا يحتوي على حالة متغيرة
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // بناء واجهة التطبيق باستخدام MaterialApp الذي يوفر تصميمًا مُعياريًا
    return MaterialApp(
      title: 'ToDo List',  // عنوان التطبيق الذي يظهر في شريط العنوان
      home: TodoScreen(),  // تعيين الشاشة الرئيسية للتطبيق، والتي هي TodoScreen
    );
  }
}
