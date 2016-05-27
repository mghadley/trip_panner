class Address < ActiveRecord::Base
	belongs_to :location
	validates :name, :street, :city, :state, :zip, :presence => true
end
