class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :company
  has_many :comments
  belongs_to :companygoer
  validates :name, :lastname, :address, presence: {message:'es requerido.'}
  validates_length_of :password, minimum: 10, too_short: 'Your password must be at least 10 letters.'
  before_create :auto_role
  def auto_role
    #if self.email.split('@')[1] == 'hechoenbolivia.com'
    if self.email == 'administrador@hechoenbolivia.com'  
      self.add_role :admin
    else
      self.add_role :user
    end
  end
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ? or lastname like ? or email like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end
end
