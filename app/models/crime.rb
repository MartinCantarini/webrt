class Crime < ActiveRecord::Base
	belongs_to :user
	def self.search(search)
  		where("ippcausanro LIKE ?", "%#{search}%") 	
	end
end
