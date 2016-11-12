class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.references :auther, index: true, foreign_key: true
      t.references :publisher, index: true, foreign_key: true
      t.date :published
      t.integer :price
      t.string :isbn
      t.date :p_date
      t.integer :p_price
      t.boolean :read

      t.timestamps null: false
    end
  end
end
