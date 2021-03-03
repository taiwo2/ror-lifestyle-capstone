class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :featured_image
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
