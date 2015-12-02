class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :contact_email
      t.string :login_email
      t.string :password_digest
      t.string :fb
      t.string :linkedin
      t.string :twitter
      t.string :github
      t.string :batch_month
      t.string :batch_year
      t.string :projects_link
      t.string :description
      t.string :avatar
      t.string :status
      t.string :slack_id

      t.timestamps null: false
    end
  end
end
