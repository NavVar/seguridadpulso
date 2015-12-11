class Country < ActiveRecord::Base
  has_many :rate_registers
  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true
  validates :code, length: {is:3}
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ? or code like ?", "%#{query}%","%#{query}%")
  end
end
