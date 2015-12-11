class RateRegister < ActiveRecord::Base
  belongs_to :country
  belongs_to :development_rate
  validates :rate_value, presence:true
  def self.search(initial,final)
    where("date_registered between ? and ?", "%#{initial}%","%#{final}%")
  end

end
