# encoding: utf-8

I18n.default_locale = :en
ADMIN_LOCALE = :ca

LANGUAGES_BY_LOCALE = {
  "en" => 'English',
  "ca" => 'Català',
  "es" => 'Castellano'
}

LANGUAGES = LANGUAGES_BY_LOCALE.to_a.map(&:reverse)
LOCALES = LANGUAGES_BY_LOCALE.keys.map(&:to_sym)
LOCALES_STRING = LANGUAGES_BY_LOCALE.keys
TRANSLATABLE_LOCALES = LOCALES - [I18n.default_locale]
