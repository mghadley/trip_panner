class Location < ActiveRecord::Base
	belongs_to :trip
	validates_presence_of :city, :country
end
