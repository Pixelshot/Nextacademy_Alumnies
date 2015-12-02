class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :text
      t.integer :user_id
      t.integer :poster_id

      t.timestamps null: false
    end
  end
end
