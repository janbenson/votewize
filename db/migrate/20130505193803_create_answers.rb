class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :id
      t.integer :agree
      t.integer :importance
      t.string :comments
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
