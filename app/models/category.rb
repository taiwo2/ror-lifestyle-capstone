class Category < ApplicationRecord
  before_save :set_slug
  has_many :categorizations, dependent: :destroy
  has_many :articles, through: :categorizations, dependent: :destroy

  validates :name, :priority, presence: true
  validates :name, length: { minimum: 5, maximum: 10 }, uniqueness: true

  scope :category_order, -> { Category.order(priority: :asc) }

  def most_recent_article
    articles = self.articles.order(created_at: :desc)
    articles[0]
  end

  def articles_order
    articles.order(created_at: :desc)
  end

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
