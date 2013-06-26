class CleanUpTables < ActiveRecord::Migration
  def change
    remove_column :events, :notes
    remove_column :events, :event_address_id
    remove_column :non_profits, :notes
  end
end
