class Article < ActiveRecord::Base
has_many :comments

belongs_to :topic

	validates :title,:description,:content,:author, presence: true
	validates :title, uniqueness: {scope: :author}
	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%")
  end
end
