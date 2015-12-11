class Ratetype < ActiveRecord::Base
	validates :name, :unit , presence: true
	validates :name, uniqueness: true
	belongs_to :rateclass
	
end
