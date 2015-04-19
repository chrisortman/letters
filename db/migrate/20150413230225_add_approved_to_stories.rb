class AddApprovedToStories < ActiveRecord::Migration
  def change
    add_column :stories, :approved, :boolean, :nil => false, :default => false
  end
end
