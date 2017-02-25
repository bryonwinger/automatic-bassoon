class CreateCircuits < ActiveRecord::Migration[5.0]
  def change
    create_table :circuits do |t|
      t.string :name
      t.text :description
      t.integer :difficulty

      t.timestamps
    end
  end
end
