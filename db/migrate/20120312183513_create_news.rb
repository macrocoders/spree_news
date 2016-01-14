class CreateNews < ActiveRecord::Migration
  def change
    create_table :spree_news do |t|
      t.string :title
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end
