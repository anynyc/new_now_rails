class CreateGratifications < ActiveRecord::Migration[5.0]
  def change
    create_table :gratifications do |t|
      t.string :message
      t.string :image
      t.string :keyword
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
