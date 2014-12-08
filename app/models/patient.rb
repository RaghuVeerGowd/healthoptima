class Patient < ActiveRecord::Base

	validates_uniqueness_of :name

	belongs_to :doctor
	
end
