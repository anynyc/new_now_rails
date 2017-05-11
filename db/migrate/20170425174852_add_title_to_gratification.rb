class AddTitleToGratification < ActiveRecord::Migration[5.0]
  def change
    add_column :gratifications, :title, :string, :default => "Yay, you've made it this far.  Good job you."
  end
end
