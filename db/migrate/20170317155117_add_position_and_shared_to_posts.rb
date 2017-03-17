class AddPositionAndSharedToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :position, :int
    add_column :posts, :times_shared, :int, default: 0
    add_column :posts, :is_hot, :boolean, default: false
  end
end
