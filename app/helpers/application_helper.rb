module ApplicationHelper

  def current_year
    "Год: #{Time.current.year}"
  end

  def github_url(author, repo)
    link_to "GitHub", "https://github.com/#{author}/#{repo}"
  end

  def school_url
    link_to "Учебный проект в онлайн-школе Thinknetica",
            "https://thinknetica.com/",
            target: :blank
  end

end
