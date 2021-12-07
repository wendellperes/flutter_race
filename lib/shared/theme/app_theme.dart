import 'app_colors.dart';
import 'text_styles.dart';
export 'app_text.dart';

class AppTheme {
  static final instance = AppTheme();

  final _colors = AppColors();
  static IAppColors get colors => instance._colors;

  final _textStyles = AppTextStyle();
  static IAppTextStyle get textStyles => instance._textStyles;
}