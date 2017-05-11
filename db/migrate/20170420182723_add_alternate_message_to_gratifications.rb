class AddAlternateMessageToGratifications < ActiveRecord::Migration[5.0]
  def change
    add_column :gratifications, :alternate_message, :string
  end
end
