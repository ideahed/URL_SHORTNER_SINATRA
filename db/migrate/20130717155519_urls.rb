class Urls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url, :short_url
      t.integer :count, default: 0
    end
  end
end
