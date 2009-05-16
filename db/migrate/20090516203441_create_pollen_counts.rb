class CreatePollenCounts < ActiveRecord::Migration
  def self.up
    create_table :pollen_counts do |t|
      t.date "date"
      t.integer 'grass'
      t.integer 'trees'
      t.integer 'weeds'
      t.integer 'fungi'
      t.timestamps
    end
  end

  def self.down
    drop_table :pollen_counts
  end
end
