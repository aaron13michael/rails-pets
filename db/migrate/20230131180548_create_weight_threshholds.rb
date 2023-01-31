class CreateWeightThreshholds < ActiveRecord::Migration[7.0]
  def change
    create_table :weight_threshholds do |t|
      t.string :pet_type
      t.string :weight_class
      t.integer :max_weight

      t.timestamps
    end
  end
end
