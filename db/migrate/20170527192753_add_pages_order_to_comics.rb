class AddPagesOrderToComics < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :pages_order, :integer, array: true
  end
end
