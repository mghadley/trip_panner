class Location < ActiveRecord::Base
	belongs_to :trip
	has_many :addresses
	validates_presence_of :city, :country
end
