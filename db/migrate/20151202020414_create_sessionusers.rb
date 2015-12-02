class CreateSessionusers < ActiveRecord::Migration
  def change
    create_table :sessionusers do |t|
      t.string :user_id
      t.string :session_email
      t.string :password_digest
      t.string :admin

      t.timestamps null: false
    end
  end
end
