class CreateEffectTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :effect_types do |t|
      t.string :name
      t.timestamps
    end
    
    create_join_table :circuits, :effect_types
  end
end
