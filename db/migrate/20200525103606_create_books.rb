class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :volume
      t.string :author
      t.integer :published_year
      t.text :comments

      t.timestamps
    end
  end
end
