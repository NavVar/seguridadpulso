class Exchange < ActiveRecord::Base
	validates :ratetype,:saleprice,:to_date, presence: true
  belongs_to :ratetype
  belongs_to :rateclass
  
end
