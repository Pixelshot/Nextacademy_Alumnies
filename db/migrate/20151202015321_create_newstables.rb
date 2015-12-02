class CreateNewstables < ActiveRecord::Migration
  def change
    create_table :newstables do |t|
      t.string :title
      t.string :body
      t.json :images
      t.string :user_id

      t.timestamps null: false
    end
  end
end
