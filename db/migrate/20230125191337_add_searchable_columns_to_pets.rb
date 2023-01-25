class AddSearchableColumnsToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :child_friendly, :boolean
    add_column :pets, :ease_of_care, :integer
    add_column :pets, :avg_weight, :integer
    add_column :pets, :min_age, :integer
    add_column :pets, :max_age, :integer
    add_column :pets, :cost, :integer
    add_column :pets, :intelligence, :integer
  end
end
