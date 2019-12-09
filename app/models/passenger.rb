class Passenger < ActiveRecord::Base
 validates :name, presence: true
 validates :email, presence: true
 #validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end