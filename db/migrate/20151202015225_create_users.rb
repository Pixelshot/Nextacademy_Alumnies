class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :fb
      t.string :linkedin
      t.string :twitter
      t.string :github
      t.integer :batch_month
      t.integer :batch_year
      t.string :projects_link
      t.string :description
      t.string :avatar
      t.string :status
      t.string :slack_id

      t.timestamps null: false
    end
  end
end
