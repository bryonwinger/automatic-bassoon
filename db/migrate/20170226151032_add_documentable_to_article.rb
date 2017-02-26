class AddDocumentableToArticle < ActiveRecord::Migration[5.0]
  def change
    change_table :articles do |t|
      t.integer :documentable_id
      t.string  :documentable_type
    end
    add_index :articles, [:documentable_type, :documentable_id]
  end
end
