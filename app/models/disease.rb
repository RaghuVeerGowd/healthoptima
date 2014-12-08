class Disease < ActiveRecord::Base
	validates_uniqueness_of :diseases_name
end
