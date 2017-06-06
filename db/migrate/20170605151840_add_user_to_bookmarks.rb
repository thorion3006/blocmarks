class AddUserToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookmarks, :user, foreign_key: true
  end
end
