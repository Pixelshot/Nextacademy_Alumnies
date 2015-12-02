class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :text
      t.string :user_id
      t.string :poster_id

      t.timestamps null: false
    end
  end
end
