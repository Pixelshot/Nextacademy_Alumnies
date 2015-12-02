class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :user_id
      t.string :session_email
      t.string :password_digest
      t.string :admin

      t.timestamps null: false
    end
  end
end
