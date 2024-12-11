// استيراد مكتبة فلاتر الخاصة بتصميم الواجهة
import 'package:flutter/material.dart';
// استيراد مكتبة Firebase Firestore للتفاعل مع قاعدة البيانات
import 'package:cloud_firestore/cloud_firestore.dart';

// تعريف كلاس TodoScreen الذي يوسع StatelessWidget لأن التطبيق لا يحتوي على حالة متغيرة
class TodoScreen extends StatelessWidget {
  // إنشاء متحكم لنص الإدخال لتخزين قيمة المهمة التي يتم إضافتها
  final TextEditingController _taskController = TextEditingController();

  // دالة لإضافة مهمة جديدة إلى Firestore
  void _addTask(String task) {
    // إضافة المهمة إلى مجموعة 'tasks' في Firestore
    FirebaseFirestore.instance.collection('tasks').add({'task': task, 'done': false});
    // مسح النص بعد إضافة المهمة
    _taskController.clear();
  }

  // دالة لتبديل حالة المهمة من 'مكتملة' إلى 'غير مكتملة' أو العكس
  void _toggleTask(String id, bool done) {
    // تحديث المهمة في Firestore مع عكس حالة "done"
    FirebaseFirestore.instance.collection('tasks').doc(id).update({'done': !done});
  }

  // دالة لحذف المهمة من Firestore
  void _deleteTask(String id) {
    // حذف المهمة بناءً على الـ ID من Firestore
    FirebaseFirestore.instance.collection('tasks').doc(id).delete();
  }

  // إعادة بناء واجهة التطبيق
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),  // عنوان الشريط العلوي
      ),
      body: Column(  // استخدمنا Column لتخطيط العناصر بشكل عمودي
        children: [
          // إضافة حقل نصي لكتابة المهمة
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(  // نستخدم Row لترتيب العناصر في سطر أفقي
              children: [
                Expanded(  // لتوسيع الحقل النصي ليأخذ المساحة المتاحة
                  child: TextField(
                    controller: _taskController,  // تعيين متحكم النص
                    decoration: InputDecoration(labelText: 'Add a task'),  // إضافة نص توجيهي داخل الحقل
                  ),
                ),
                // زر لإضافة المهمة
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // التحقق إذا كان هناك نص مدخل قبل إضافة المهمة
                    if (_taskController.text.isNotEmpty) {
                      _addTask(_taskController.text);  // استدعاء دالة إضافة المهمة
                    }
                  },
                ),
              ],
            ),
          ),
          // عرض المهام من Firebase باستخدام StreamBuilder
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
              builder: (context, snapshot) {
                // إذا كانت البيانات غير جاهزة بعد، نعرض دائرة تحميل
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final tasks = snapshot.data!.docs;  // تخزين المهام المسترجعة من Firestore

                return ListView.builder(  // إنشاء قائمة لعرض المهام
                  itemCount: tasks.length,  // عدد المهام
                  itemBuilder: (context, index) {
                    final task = tasks[index];  // الحصول على المهمة في هذه الخانة
                    return ListTile(  // كل مهمة سيتم عرضها في ListTile
                      title: Text(
                        task['task'],  // نص المهمة
                        style: TextStyle(
                          decoration: task['done'] ? TextDecoration.lineThrough : null,  // إذا كانت المهمة مكتملة، يتم وضع خط في المنتصف
                        ),
                      ),
                      // خانة اختيار للإشارة إذا كانت المهمة مكتملة
                      leading: Checkbox(
                        value: task['done'],  // حالة المهمة (مكتملة أو غير مكتملة)
                        onChanged: (value) {
                          _toggleTask(task.id, task['done']);  // استدعاء دالة التبديل
                        },
                      ),
                      // زر الحذف لحذف المهمة
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteTask(task.id);  // استدعاء دالة الحذف
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
