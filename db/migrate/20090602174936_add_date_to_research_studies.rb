class AddDateToResearchStudies < ActiveRecord::Migration
  def self.up
    add_column :opportunities, :starts_at, :date
    add_column :opportunities, :ends_at, :date
  end

  def self.down
    remove_column :opportunities, :starts_at
    remove_column :opportunities, :ends_at
  end
end
