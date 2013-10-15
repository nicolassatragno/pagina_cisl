class AddIntNivelToUsuario < ActiveRecord::Migration
  def change
  change_table :usuarios do |u|
    u.integer :nivel
    end
  end
end
