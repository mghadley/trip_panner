class Trip < ActiveRecord::Base
	has_many :locations, dependent: :destroy
	validates_presence_of :title
	validates :budget, :length, numericality: { greater_than: 0 }
	validate :trip_date_cannot_be_in_the_past,

 
  def trip_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
end
