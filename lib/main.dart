import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:untitled/helpers/local_storage/local_storage.dart';
import 'package:untitled/shared/MyBlocObserver.dart';
import 'package:untitled/shared/styles/constant_text_style.dart';
import 'package:untitled/views/login_view/login_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //دية حاجة مهمة للترجمة
  await EasyLocalization.ensureInitialized();

  //انت لو دخلت على باكج البلوك هتعرف ان دية بتساعدك انك لما تغير الحالة الى حالة هيظهرلك فى ال Run
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  //دية علشان تعمل  Instance مرة واحدة فى التطبيق كلة
  await LocalStorage.init();

  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: const [
      Locale('ar'),
      Locale('en')
    ], //must be in this arrangement
    path: "assets/lang",
    startLocale: const Locale('ar'),
    saveLocale: true,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.black));
    return ScreenUtilInit(
      //1080 * 2280  pixel 4  5.7
      //دة التلفون الكلنا هنشتغل علية علشان يبقى موحد على الكل

      designSize: const Size(392.72727272727275, 781.0909090909091),
      // designSize: const Size(753.5999755859375, 1536),
      builder: (_,child) => OKToast(
        child: MaterialApp(
          builder: (context, widget) {
            //add this line
            ScreenUtil.init(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          //builder: BotToastInit(),
          title: 'VizageClient',

          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // fontFamily: "Tajawal",
              appBarTheme: AppBarTheme(
                  titleTextStyle: ConstantTextStyle.title20BlackTextStyle),
              primarySwatch: Colors.blue,
              canvasColor: Colors.white),
          // هنا كل واحد يحط الكلاس بتاعة علشان يبقى عارف ال flow بتاعة
          // Scaffold يعنى هتشيل ال
          // وتحط الكلاس بتاعك
          // مش مهم تشيل بتاع زميلك المهم , تاخد اسم كلاس زميلك وتعملة كومينت زى المثال التحت
          // SplashScreen()
          // وتحط الكلاس بتاعك
          home:  LoginScreen(),
        ),
      ),
    );
  }
}


