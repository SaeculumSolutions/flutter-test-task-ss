import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:viswals_test/Core/Constants/Enums/AppFontFamily.dart';
import 'package:viswals_test/Core/Network/NetworkHandler.dart';
import 'package:viswals_test/Core/Router/AppRouter.dart';
import 'package:viswals_test/Core/SharedPreferences/shared_preferences.dart';
import 'package:viswals_test/Core/Utils/AppColors.dart';
import 'package:viswals_test/Features/Questions/Data/QuestionsLocalDataHandler.dart';
import 'package:viswals_test/Features/Questions/Data/QuestionsRepository.dart';
import 'package:viswals_test/Features/Questions/Provider/QuestionsProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dotenv.load();
  UserPreference.initSharedPrefs();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => NetworkHandler()),
        Provider(create: (context) => QuestionsLocalDataHandler()),
        Provider(
            create: (context) => QuestionsRepository(
                networkHandler: context.read<NetworkHandler>())),
        ChangeNotifierProvider(
            create: (context) => QuestionsProvider(
                localDataHandler: context.read<QuestionsLocalDataHandler>(),
                questionsRepository: context.read<QuestionsRepository>()))
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        child: MaterialApp.router(
          routerConfig: router,
          title: "Viswals Test",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: AppFontFamily.Montserrat.name,
              splashColor: Colors.transparent,
              focusColor: AppColors.transparent,
              highlightColor: AppColors.transparent,
              hoverColor: AppColors.transparent,
              scaffoldBackgroundColor: AppColors.background),
        ),
      ),
    );
  }
}
