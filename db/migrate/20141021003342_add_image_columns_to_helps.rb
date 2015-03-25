class AddImageColumnsToHelps < ActiveRecord::Migration
  def self.up
    add_attachment :helps, :image
  end

  def self.down
    remove_attachment :helps, :image
  end
end
