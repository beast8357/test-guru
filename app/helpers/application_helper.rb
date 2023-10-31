module ApplicationHelper

  FLASH_TYPES = { notice: 'alert-success', alert: 'alert-danger' }.freeze

  def current_year
    t('.current_year', year: Time.current.year)
  end

  def github_url(author, repo)
    link_to "GitHub", "https://github.com/#{author}/#{repo}"
  end

  def school_url
    link_to t('.school_url'), "https://thinknetica.com/",
            target: :blank
  end

  def show_flash
    flash.map do |flash_type, message|
      content_tag :p, message, class: "alert #{FLASH_TYPES[flash_type.to_sym]}"
    end.join.html_safe
  end

  def icon(name, text)
    content_tag :i, text, class: "bi bi-#{name}"
  end

  def select_language(lang)
    url_for(lang: lang.to_sym)
  end

end
