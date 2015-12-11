class Companygoer < ActiveRecord::Base
  has_many :users
  has_many :companies, :through => :users
end
