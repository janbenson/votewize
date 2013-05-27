class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :id
      t.string :cat1
      t.string :cat2
      t.string :cat3
      t.string :cat4
      t.string :cat5
      t.string :cat7
      t.string :cat6
      t.string :cat7
      t.string :cat8
      t.string :cat9
      t.string :cat10
      t.string :cat11
      t.string :cat12
      t.string :cat13
      t.string :cat14
      t.string :cat15
      t.string :cat16
      t.string :cat17
      t.string :cat18

      t.timestamps
    end
  end
end
