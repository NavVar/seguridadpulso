class Coinrate < ActiveRecord::Base
	validates :ratetype,:sale, :buy ,:todate, presence: true

  belongs_to :ratetype
end
