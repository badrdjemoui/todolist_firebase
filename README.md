شرح الكود بالتفصيل:
TextEditingController: يستخدم للتحكم في النص المدخل في حقل الإدخال.
FirebaseFirestore: مكتبة Firebase الخاصة بالتفاعل مع قاعدة البيانات السحابية.
StreamBuilder: أداة لرصد البيانات الحية من Firebase و تحديث الواجهة تلقائيًا عند تغيّر البيانات في Firestore.
ListTile: عنصر واجهة المستخدم الذي يعرض كل مهمة، ويحتوي على نص المهمة وزر الحذف وصندوق الاختيار لتحديد ما إذا كانت المهمة مكتملة.
IconButton: زر لفتح إضافة مهمة جديدة أو حذف مهمة.



شرح الكود:----------------------------------------------------

WidgetsFlutterBinding.ensureInitialized():

هذه الدالة تضمن أن فلاتر قد تم تهيئتها بالكامل قبل تنفيذ أي كود آخر. يتم استخدامها عادةً عند استخدام ميزات غير Flutter، مثل Firebase.
await Firebase.initializeApp():

هذه السطر يقوم بتهيئة Firebase في التطبيق بشكل غير متزامن (asynchronously). يجب استدعاؤه قبل استخدام أي من خدمات Firebase في التطبيق.
runApp(MyApp()):

هذه الدالة تبدأ التطبيق بعد أن يتم تهيئة جميع الأشياء الضرورية مثل Firebase. MyApp هو الكلاس الذي يمثل واجهة التطبيق.
MaterialApp:

MaterialApp هو ويدجيت خاص بـ Flutter يوفر واجهة المستخدم الأساسية للمزيد من العناصر التي تتبع تصميم Material Design (مثل الأزرار، القوائم، وأشرطة العناوين).
من خلاله، نقوم بتحديد العنوان الخاص بالتطبيق وكذلك الشاشة الرئيسية التي ستظهر عند فتح التطبيق وهي TodoScreen().
MyApp (StatelessWidget):

MyApp هو كلاس لا يحتوي على حالة متغيرة، لذلك نستخدم StatelessWidget. يتم بناء الواجهة داخل دالة build() التي تُعيد واجهة مستخدم.
يحتوي home: TodoScreen() على تعريف الشاشة الرئيسية التي ستظهر للمستخدم عند فتح التطبيق، وهي شاشة تحتوي على قائمة المهام (ToDo).
لماذا نستخدم await Firebase.initializeApp()؟
لأن Firebase يحتاج إلى تهيئة قبل استخدامه في التطبيق. وعادة ما تتم هذه التهيئة في بداية التطبيق لضمان أن جميع الخدمات مثل Firebase Firestore و Firebase Auth جاهزة للاستخدام بمجرد أن يبدأ التطبيق في العمل.
خلاصة:
الكود يبدأ التطبيق عن طريق تهيئة Firebase ثم يعرض شاشة تحتوي على قائمة مهام، وتستخدم واجهة Flutter لعرض المهام التي يتم إدخالها وتخزينها في Firebase Firestore.



Empreinte SHA-1 du certificat de signature de débogage (facultatif)

لاستخراج  SHA-1


open terminal:


E:\flutter\examples\myfproject\chickenjson\cd android


PS E:\flutter\examples\myfproject\chickenjson\android> ./gradlew signingReport
