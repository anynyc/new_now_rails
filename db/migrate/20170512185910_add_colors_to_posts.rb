class AddColorsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :r_value, :string, :default => "0"
    add_column :posts, :g_value, :string, :default => "0"
    add_column :posts, :b_value, :string, :default => "0"
    add_column :posts, :a_value, :string, :default => "0.76"
  end
end
