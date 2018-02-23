class AddAttachmentImageToStatements < ActiveRecord::Migration[5.1]
  def self.up
    change_table :statements do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :statements, :image
  end
end
