class CreateJots < ActiveRecord::Migration[5.1]
  def change
    create_table :jots do |t|
      t.string :content, null: false
      t.boolean :public, default: false
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
