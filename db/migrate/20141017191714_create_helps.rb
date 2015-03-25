class CreateHelps < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.string :title,  null: false
      t.text :content,  null: false
      t.belongs_to :user,  null: false
      t.belongs_to :sticky,  null: false
      t.timestamps 
    end
  end
end
