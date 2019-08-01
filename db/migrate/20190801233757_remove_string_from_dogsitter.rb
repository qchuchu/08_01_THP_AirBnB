class RemoveStringFromDogsitter < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogsitters, :string, :string
  end
end
