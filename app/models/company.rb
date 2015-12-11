class Company < ActiveRecord::Base
	validates :nit,:name,:background,:location, presence: true
	validates :name, uniqueness: {message:'ya ha sido utilizado.'}
	validates :nit, uniqueness: {message:'ya ha sido utilizado.'}
	validate :valid_nit?
	has_attached_file :image,:storage => :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml")
	validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
	has_many :users
	has_many :companygoers, :through => :users

	def valid_nit?
		unless self.nit.scan(/[\D]/).empty?
			errors.add(:nit, 'debe contener caracteres numéricos únicamente.')
		end
	end

	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ? and nit <> ?", "%#{query}%",0)
  end
end
