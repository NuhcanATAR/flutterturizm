enum RegisterViewStrings {
  emailLoginBtnText('E-mail ile Giriş Yap'),
  googleLoginBtnText('Google ile Giriş yap'),
  registerTitleText('Hesabınızı Oluşturun!'),
  registerSubTitleText('Uygulamayı kullanmak için hesabınızı oluşturun'),
  nameInputText('Ad *'),
  surnameInputText('Soyad *'),
  identificationNumberInputText('TC Kimlik Numarası *'),
  cityInputText('Şehir *'),
  districtInputText('İlçe *'),
  phoneNumberInputText('Telefon Numarası *'),
  dateOfBirthInputText('Doğum Tarihi *'),
  genderTypeMenText('Erkek'),
  genderTypeWomenText('Kadın'),
  emailInputText('E-mail *'),
  passwordInputText('Şifre *'),
  passwordAgainInputText('Şifre Tekrar *'),
  userAgreementText('Kullanıcı sözleşmesini okudum ve kabul ediyorum.'),
  userAgreementErrorText('Kullanıcı sözleşmesini onaylamanız gerek!'),
  passwordErrorText('Şifreniz Aynı Değil, lütfen kontrol ediniz.'),
  identificationIDErrorText(
    'TC Kimlik numaranız hatalı lütfen kontrol ediniz.',
  ),
  phoneNumberErrorText('Telefon numaranız hatalı lütfen kontrol ediniz.'),
  registerFormErrorText('Lütfen boş alan bırakmayınız!'),
  registerButtonText('Hesabı Oluştur'),
  registerEmailAlReadyInUse(
    'E-mail Adresi daha önceden kayıtlı, başka e-mail adresi deneyiniz.',
  ),
  registerErrorText(
    'Kayıt işlemi esnasında hata oluştu daha sonra tekrar deneyiniz.',
  ),
  registerSuccessText(
    'Hesabınız başarıyla oluşturuldu, kayutlı e-mail adresinizi en kısa sürede hesabınızı doğrulayınız.',
  );

  final String value;
  const RegisterViewStrings(this.value);
}
