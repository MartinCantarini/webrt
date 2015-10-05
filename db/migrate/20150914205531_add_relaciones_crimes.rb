class AddRelacionesCrimes < ActiveRecord::Migration
  def change
  	add_reference :crimes , :user
  end
end
