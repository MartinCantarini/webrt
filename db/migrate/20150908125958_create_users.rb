class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :atcodigodearea
      t.string :atabonadotelefonico
      t.string :atcelularofijo
      t.string :atempresa
      t.string :atlocalidadcodigoarea

      t.timestamps
    end
  end
end
