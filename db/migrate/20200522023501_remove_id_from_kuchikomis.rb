class RemoveIdFromKuchikomis < ActiveRecord::Migration[5.2]
  def change
    remove_column :kuchikomis, :user_id, :string
    remove_column :kuchikomis, :post_id, :string
  end
end
