class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  def categories_attributes=(category_attributes)
  	self.save
  	category_attributes.each_with_index do |category, index|
  		if !category[1]["name"].empty?
  			cat = Category.find_or_create_by(name: category[1]["name"])
  			postc = PostCategory.create(category_id: cat.id, post_id: self.id)
  		end
  	end
  end

end
