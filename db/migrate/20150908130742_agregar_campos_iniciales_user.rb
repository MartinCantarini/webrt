class AgregarCamposInicialesUser < ActiveRecord::Migration
  def change
  	add_column :users, :ttnombre, :string
  	add_column :users, :ttdomicilio, :string
  	add_column :users, :ttlocalidad, :string
  	add_column :users, :ttdocumento, :string
  	add_column :users, :tnombre, :string
  	add_column :users, :tdomicilio, :string
  	add_column :users, :tlocalidad, :string
  	add_column :users, :tdocumento, :string
  	add_column :users, :unombre, :string
  	add_column :users, :udomicilio, :string
  	add_column :users, :ulocalidad, :string
  	add_column :users, :documento, :string  
  end
end
