# Initial migration for log entries.
class CreateLogEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :log_entries do |t|
      t.text :text
      t.string :user
      t.date :for_date
      t.timestamps
    end
  end
end
