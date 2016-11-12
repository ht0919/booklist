class CreateAuthers < ActiveRecord::Migration
  def change
    create_table :authers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
