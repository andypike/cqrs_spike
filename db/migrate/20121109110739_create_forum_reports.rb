class CreateForumReports < ActiveRecord::Migration
  def change
    create_table :forum_reports do |t|
      t.string :entity_id
      t.string :name

      t.timestamps
    end
    add_index :forum_reports, :entity_id
  end
end
