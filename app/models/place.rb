class Place < ActiveRecord::Base
	validates :name, length: { minimum: 3 }
	validates_presence_of :name, :location, :place_type
	validates :location, length: { minimum: 2 }

	has_many :alerts

end
