class AddCategoryIdToProdutos < ActiveRecord::Migration
  def change
    add_column :produtos, :category_id, :integer
  end
end
