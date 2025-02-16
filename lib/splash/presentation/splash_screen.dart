import 'package:amigo_pet/home/presentation/ui/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../colors/app_colors.dart';
import '../domain/splash_screen_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SplashScreenCubit(LoadingState());

    return BlocBuilder<SplashScreenCubit, SplashScreenState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is SuccessState) {
          if (state.shouldUpdate) {
            openAppStore(context);
          } else {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                _navigateToHome(context);
              },
            );
          }
        }

        return Container(
          color: AppColors.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash_image.jpg'),
              SizedBox(height: 20),
              const CircularProgressIndicator(
                color: AppColors.pastelOrange,
              ),
            ],
          ),
        );
      },
    );
  }
}

void _navigateToHome(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );
}

void openAppStore(BuildContext context) async {
  final String appId = "com.bs2.empresas";

  final Uri appStoreUrl = Uri.parse("https://apps.apple.com/app/id$appId");
  final Uri playStoreUrl = Uri.parse(
      "https://play.google.com/store/apps/details?id=com.example.yourapp");

  if (await canLaunchUrl(playStoreUrl) || await canLaunchUrl(appStoreUrl)) {
    final Uri url = Uri.parse(
      Theme.of(context).platform == TargetPlatform.iOS
          ? appStoreUrl.toString()
          : playStoreUrl.toString(),
    );
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("Could not open the store link.");
  }
}
