class AddAttachmentPhotoToProdutos < ActiveRecord::Migration
  def self.up
    change_table :produtos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :produtos, :photo
  end
end
