class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :details
      t.string :image
      t.timestamp :modifieddt

      t.timestamps
    end
  end
end
