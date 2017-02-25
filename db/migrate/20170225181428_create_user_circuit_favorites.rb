class CreateUserCircuitFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :user_circuit_favorites, id: false do |t|
      t.integer :user_id
      t.integer :circuit_id
    end

    add_index :user_circuit_favorites, :user_id
    add_index :user_circuit_favorites, :circuit_id
  end
end
