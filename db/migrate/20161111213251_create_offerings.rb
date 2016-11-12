class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.references :produto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
