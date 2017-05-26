class AddUsersToComics < ActiveRecord::Migration[5.1]
  def change
    add_reference :comics, :user, index: true
  end
end
