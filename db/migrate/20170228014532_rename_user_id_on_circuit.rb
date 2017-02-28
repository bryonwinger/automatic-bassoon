class RenameUserIdOnCircuit < ActiveRecord::Migration[5.0]
  def change
    rename_column :circuits, :user_id, :submitter_id
  end
end
