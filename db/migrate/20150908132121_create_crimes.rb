class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.string :ippcausanro
      t.string :delito
      t.string :interviene
      t.datetime :fecha
      t.text :detalles

      t.timestamps
    end
  end
end
