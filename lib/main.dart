import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/view/loading_view/loading_screen.dart';
import 'package:untitled/view/login_view/login_screen.dart';
import 'package:untitled/view_model/layout_view_model/layout_cubit.dart';
import 'helpers/local_storage/local_storage.dart';
import 'shared/MyBlocObserver.dart';
import 'shared/styles/constant_text_style.dart';
import 'view/layout_view/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //انت لو دخلت على باكج البلوك هتعرف ان دية بتساعدك انك لما تغير الحالة الى حالة هيظهرلك فى ال Run

  //دية علشان تعمل  Instance مرة واحدة فى التطبيق كلة
  await LocalStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  BlocOverrides.runZoned(
        () {
      // Use cubits...
      runApp(
        MyApp(),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.black));
    return BlocProvider(
      create: (context) => LayoutCubit()..getUser(),
      child: ScreenUtilInit(
        //1080 * 2280  pixel 4  5.7
        //دة التلفون الكلنا هنشتغل علية علشان يبقى موحد على الكل
        designSize: const Size(360, 760),
        builder: (_, child) =>
            MaterialApp(
              builder: BotToastInit(),
              navigatorObservers: [BotToastNavigatorObserver()],
              title: 'task_kortoba',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  fontFamily: "Almarai",
                  appBarTheme: AppBarTheme(
                      titleTextStyle: ConstantTextStyle.title18GrayTextStyle),
                  primarySwatch: Colors.blue,
                  canvasColor: Colors.white),
              // هنا كل واحد يحط الكلاس بتاعة علشان يبقى عارف ال flow بتاعة
              // Scaffold يعنى هتشيل ال
              // وتحط الكلاس بتاعك
              // مش مهم تشيل بتاع زميلك المهم , تاخد اسم كلاس زميلك وتعملة كومينت زى المثال التحت
              // SplashScreen()
              // وتحط الكلاس بتاعك
              home: LocalStorage.getData(key: 'uId') != null
                  ? LayoutScreen()
                  : LoginScreen(),
            ),
      ),
    );
  }
}
