class AddColumnWeightClassToPets < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :ease_of_care, :difficulty
    add_column :pets, :weight_class, :string
  end
end
