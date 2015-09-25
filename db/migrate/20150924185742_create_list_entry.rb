class CreateListEntry < ActiveRecord::Migration
  def change
      create_table :list_entries do |t|
          t.string :name
          t.string :email
          t.integer :user_id
          t.timestamps
      end
  end
end
