class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :access_level
      t.integer :creator_id, foreign_key_for: :users
      t.timestamps
    end

    create_table :assignments do |t|
      t.references :user
      t.references :task
      t.timestamps
    end

    create_table :reviews do |t|
      t.references :task
      t.integer :reviewer_id
      t.text :text
    end
  end
end
