class Product < ActiveRecord::Base
  has_many :order_items
# This default seeting stops items being displayed if they are not active
  default_scope { where(active: true) }

  has_many :comments
  validates :name, presence: true


  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating_comment
    comments.average(:rating).to_f
  end

  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end
end
