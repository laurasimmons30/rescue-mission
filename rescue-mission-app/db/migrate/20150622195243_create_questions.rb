class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, unique: true
      t.string :body, null: false, unique: true
      t.integer :user_id
      
      t.timestamps
    end
  end
end
