class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :company, null: false
      t.string :series, null: false
      t.string :car, null: false
      t.string :place, null: false
      t.string :line, null: false
      t.string :title, null: false
      t.text :body
      t.string :date, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
