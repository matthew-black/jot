class RemoveSmallAndThumbUrls < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :small_url
    remove_column :photos, :thumb_url
  end
end