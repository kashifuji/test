class RemoveUpdateTimeToUser < ActiveRecord::Migration
  def change
    remove_column :users, :update_time, :string
  end
end
