enum PasswordViewStrings {
  titleText('Şifrenizimi Unuttunuz?'),
  subTitleText(
    'Heabınıza kayıtlı e-mail adresinizi girerek şifrenizi yenileyebilirsiniz.',
  ),
  emailInputText('E-mail *'),
  sendMailButtonText('Şifre Yenile'),
  formErrorText('Lütfen gerekli alanı doldurunuz!'),
  emailErrorText(
    'E-mail adresi hatalı, lütfen e-mail adresinizi kontrol ediniz.',
  ),
  sendMailSuccessText(
    'Yenileme Bağlantısı başarıyla gönderildi, e-mail adresinizi kontrol ediniz!',
  ),
  sendMailErrorText(
    'E-mail gönderilirken bir sorun oluştu daha sonra tekrar deneyiniz!',
  );

  final String value;
  const PasswordViewStrings(this.value);
}
