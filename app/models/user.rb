class User < ActiveRecord::Base
	has_many :crimes
	validates :atcodigodearea, presence: true 
	validates :atabonadotelefonico, presence: true
	def self.search(search)
  		where("atabonadotelefonico LIKE ? OR ttnombre LIKE ? OR ttdomicilio LIKE ? OR ttdocumento LIKE ? OR tnombre LIKE ? OR tdomicilio LIKE ? OR tdocumento LIKE ? OR unombre LIKE ? OR udomicilio LIKE ? OR udocumento LIKE ? OR atimei LIKE ? OR atsim LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 	
	end
end
