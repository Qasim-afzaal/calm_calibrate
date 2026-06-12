import 'package:calm_calibrate/app/app.dart';
import 'package:calm_calibrate/app/bootstrap.dart';
import 'package:calm_calibrate/core/animations/breathe_animation.dart';
import 'package:calm_calibrate/core/animations/fade_slide_in.dart';
import 'package:calm_calibrate/core/animations/float_animation.dart';
import 'package:calm_calibrate/core/animations/pulse_ring.dart';
import 'package:calm_calibrate/core/widgets/exercise/exercise_pose_animation.dart';
import 'package:calm_calibrate/presentation/widgets/premium/paywall_exercise_slider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    BreatheAnimation.globallyEnabled = false;
    FloatAnimation.globallyEnabled = false;
    PulseRing.globallyEnabled = false;
    FadeSlideIn.globallyEnabled = false;
    ExercisePoseAnimation.globallyEnabled = false;
    PaywallExerciseSlider.globallyEnabled = false;
  });

  tearDown(() {
    BreatheAnimation.globallyEnabled = true;
    FloatAnimation.globallyEnabled = true;
    PulseRing.globallyEnabled = true;
    FadeSlideIn.globallyEnabled = true;
    ExercisePoseAnimation.globallyEnabled = true;
    PaywallExerciseSlider.globallyEnabled = true;
  });

  testWidgets('Splash screen loads and navigates to welcome', (tester) async {
    await AppBootstrap.init();
    await tester.pumpWidget(const CalmCalibrateApp());
    await tester.pump();

    expect(find.text('CalmCalibrate'), findsOneWidget);

    for (var i = 0; i < 8; i++) {
      await tester.pump(const Duration(milliseconds: 500));
      if (tester.any(find.text('Get Started'))) break;
    }

    expect(find.text('Get Started'), findsOneWidget);
  });
}
