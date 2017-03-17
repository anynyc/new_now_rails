class AddDayIdToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :day_id, :int
  end
end
