class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :headline
      t.string :body
      t.string :length
      t.string :link
      t.datetime :date

      t.timestamps
    end
  end
end
