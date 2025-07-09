class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :body
      t.date :deadline
      t.boolean :is_completed
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
