class AddLinkTextToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :link_text, :string, :default => "READ THIS"
  end
end
