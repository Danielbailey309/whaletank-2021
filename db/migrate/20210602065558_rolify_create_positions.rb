class RolifyCreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table(:positions) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:members_positions, :id => false) do |t|
      t.references :member
      t.references :position
    end
    
    add_index(:positions, [ :name, :resource_type, :resource_id ])
    add_index(:members_positions, [ :member_id, :position_id ])
  end
end
