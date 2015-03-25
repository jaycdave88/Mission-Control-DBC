class AddImageColumnsToStickies < ActiveRecord::Migration
  def self.up
    add_attachment :stickies, :image
  end

  def self.down
    remove_attachment :stickies, :image
  end

end
