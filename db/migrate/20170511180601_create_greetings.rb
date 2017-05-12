class CreateGreetings < ActiveRecord::Migration[5.0]
  def change
    create_table :greetings do |t|
      t.string :title, :default => "7 things you need to know about design today."
      t.string :edition, :default => "EDITION 001"

      t.timestamps
    end
  end
end
