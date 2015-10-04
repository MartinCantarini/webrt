class AddRelaciones < ActiveRecord::Migration
  def change
  	add_reference :users , :crime
  	add_reference :crimes , :user
  end
end
