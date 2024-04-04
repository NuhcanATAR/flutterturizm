enum LoginViewStrings {
  loginTitleText('Hesabınıza giriş yapın'),
  loginSubTitleText('Mevcut hesabınız varsa giriş yapabilirsiniz.'),
  loginEmailInputText('E-mail *'),
  loginPasswordInputText('Şifre *'),
  loginForgotPasswordInputText('Şifremi Unuttum!'),
  loginButtonText('Giriş yap'),
  loginGoogleAuthButtonText('Google ile giriş yap'),
  loginRegisterButtonText('Kayıt ol'),

  // snackbar
  loginErrorSnackBarText('Lütfen giriş bilgilerinizi kontrol ediniz.'),
  loginEmailVerifiedErrorSnackBarText(
    'E-mail Adresiniz Doğrulanmamıştır, lütfen e-mail adresinizi doğrulayınız.',
  ),

  // login validator
  loginValidatorText('Lütfen E-mail ve Şifrenizi Giriniz.'),

  // cubit state
  loginUserNotFount(
    'Kullanıcı bulunamadı. Lütfen e-posta adresinizi kontrol ediniz.',
  ),
  loginWrongPassword('Lütfen şifrenizi kontrol ediniz.'),
  loginTooManyRequest(
    'Çok fazla hatalı giriş, engellendiniz lütfen kısa bir süre sonra tekrar deneyiniz!',
  ),
  loginInvalidEmail('E-mail Adrei Geçersizdir'),
  loginAuthError('Giriş işlemi başarsızı oldu, bilgilerinizi kontrol ediniz.'),
  loginGoogleAuthError(
    'Google ile Giriş yapma esnasında bir hata oluştu, tekrar deneyiniz!',
  );

  final String value;
  const LoginViewStrings(this.value);
}
