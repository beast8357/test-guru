module ApplicationHelper

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

  def icon(name)
      "<i class='bi bi-#{name}'></i>".html_safe
  end

end
