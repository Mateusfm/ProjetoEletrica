class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.string :subtitulo
      t.text :texto

      t.timestamps null: false
    end
  end
end
