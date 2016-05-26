class Trip < ActiveRecord::Base
	has_many :locations, dependent: :destroy
	validates_presence_of :title
	validates :budget, :length, numericality: { greater_than: 0 }
	# validates :date, greater_than_or_equal_to: Time.now
end
