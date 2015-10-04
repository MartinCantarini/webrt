class AgregarCamposInicialesUser2 < ActiveRecord::Migration
  def change
  	add_column :users, :atimei, :string
  	add_column :users, :atsim, :string
  	rename_column :users, :documento, :udocumento
  end
end
