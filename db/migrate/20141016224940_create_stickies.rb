class CreateStickies < ActiveRecord::Migration
  def change
    create_table :stickies do |t|
      t.string :title, null: false
      t.text :content,  null: false
      t.belongs_to :user, null:false
      t.timestamps
    end
  end
end
