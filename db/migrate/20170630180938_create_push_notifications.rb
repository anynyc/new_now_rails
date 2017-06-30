class CreatePushNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :push_notifications do |t|
      t.string :message
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end
