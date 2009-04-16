class CreateEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.string :title
      t.text :description
      t.string :type
      t.timestamps
      t.timestamps
    end
  end

  def self.down
    drop_table :employments
  end
end
