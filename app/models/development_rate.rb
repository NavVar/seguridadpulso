class DevelopmentRate < ActiveRecord::Base
  has_many :rate_registers
  validates :name, :description, presence:true
  validates :name, uniqueness:true
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
  end
end
