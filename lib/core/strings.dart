class S {
  static const String app_name = "";

  //login
  static const String enter = 'Войти';

  static const String hellow_title= "Добро пожаловать назад! \n" +
  "Войдите в свой аккаунт для дальнейшей работы";

  static const String login_edit_text = 'Логин';

  static const String password_edit_text = 'Пароль';

  static const String checkbox_remember_me = 'Запомнить меня';

  static const String forgot_password = 'Забыли пароль?';


  //bottom app bar

  static const String home = 'Главная';

  static const String qr_code = 'Сканер товаров';

  static const String map = 'Карта магазина';

  //bottom app bar

  static const String qr_code_adv = 'Наведите камеру на штрих-код \n товара, чтобы вывести \n подробную информацию о нём';

  static const String go = 'Перейти';

  //detail page

  static const String code = 'Код:';



  //errors
  static const String error_title = "Ошибка";
  static const String auth_error = "Ошибка авторизации";
  static const String profile_error = "Ошибка получения профиля";


}


extension StringCasingExtension on String {
  String toCapitalized() => this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
}
