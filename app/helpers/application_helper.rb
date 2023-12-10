module ApplicationHelper
  def translation_link
    link_locale = I18n.locale == :en ? 'pt-BR' : 'en'
    image_path = I18n.locale == :en ? 'application/brazil-flag-button.png' : 'application/usa-flag-button.png'

    link_to(url_for(locale: link_locale)) do
      image_tag(image_path, class: 'translate-button')
    end
  end
end
