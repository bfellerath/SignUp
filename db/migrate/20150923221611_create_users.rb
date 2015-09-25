class CreateUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
          t.string :username
          t.string :password_hash # Hidden password
          t.string :token # Used for API
          t.timestamps
      end
  end
end
