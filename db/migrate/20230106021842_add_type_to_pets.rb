class AddTypeToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :type, :string
  end
end
