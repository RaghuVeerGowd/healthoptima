class Hospital < ActiveRecord::Base

	validates_uniqueness_of :hospital_name

	belongs_to :user
	has_many :doctors
	has_many :patients
	
end
