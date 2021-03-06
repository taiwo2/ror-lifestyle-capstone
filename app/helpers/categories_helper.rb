module CategoriesHelper
  private

  def category_background(category)
    if category.most_recent_article
      cloudinary_url(category.most_recent_article.image.key, width: 400, crop: :scale)
    else
      'https://images.unsplash.com/photo-1573164574001-518958d9baa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'
    end
  end

  def article_image(article, width = 400)
    if article
      cloudinary_url(article.image.key, width: width, crop: :scale)
    else
      'https://images.unsplash.com/photo-1573164574001-518958d9baa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'
    end
  end

  def category_article1(articles, count)
    articles[2 * count]
  end

  def category_article2(articles, count)
    articles[2 * count + 1]
  end

  def displa(articles, row_count, category)
    if !articles.empty?
      row_count.times do |count|
        content_tag :div, class: 'article-row' do
          render 'article_card', article: category_article1(articles, count), category: category.name
          if category_article2(articles, count)
            render 'article_card', article: category_article2(articles, count), category: category.name
          end
        end
      end
    else
      content_tag :h3, 'Please add some articles'
    end
  end
end
