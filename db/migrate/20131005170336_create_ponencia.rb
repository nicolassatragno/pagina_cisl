class CreatePonencia < ActiveRecord::Migration
  def change
    create_table :ponencia do |t|
      t.string :titulo
      t.string :expositor
      t.text :descripcion

      t.timestamps
    end
  end
end
