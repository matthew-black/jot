class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.string :photog_name, null: false
      t.string :photog_url, null: false

      t.timestamps
    end
  end
end
