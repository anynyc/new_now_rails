class AddButtonLabelToGratification < ActiveRecord::Migration[5.0]
  def change
    add_column :gratifications, :button_label, :string, :default => "Go!"
  end
end
