module ApplicationHelper
  def my_icon(icon_name, options = {})
    file = File.read(Rails.root.join('app', 'assets', 'icons', "#{icon_name}.svg"))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'

    options.each { |attr, value| svg[attr.to_s] = value }

    doc.to_html.html_safe
  end

  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: 'active')
    else
      link_to(text, url)
    end
  end

  def all_routes
    routes = []
    Category.all.each do |cat|
      routes << (nav_link_to cat.name.capitalize, category_path(cat.slug))
    end

    routes
  end

  def vote?(user, article)
    new_vote = link_to(my_icon('vote', class: 'vote-icons'),
                       article_vote_path(article), method: :post, remote: true)
    delete = link_to(my_icon('voted', class: 'vote-icons'),
                     article_vote_path(article), method: :delete, remote: true)
    output = user&.votes?(article) ? delete : new_vote
    output.html_safe
  end
end
