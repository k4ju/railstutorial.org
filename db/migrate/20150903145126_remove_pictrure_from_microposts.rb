class RemovePictrureFromMicroposts < ActiveRecord::Migration
  def change
    remove_column :microposts, :pictrure, :string
  end
end
