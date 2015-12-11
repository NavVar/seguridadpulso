class Topic < ActiveRecord::Base
	has_many :articles

	
	validates :name,presence: true
	validates :name, uniqueness: true
end
