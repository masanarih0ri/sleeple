class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :content, null: false
      t.boolean :is_active, null: false

      t.timestamps
    end
  end
end
