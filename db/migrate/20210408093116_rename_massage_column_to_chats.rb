class RenameMassageColumnToChats < ActiveRecord::Migration[5.2]
  def change
    rename_column :chats, :massage, :message
  end
end
