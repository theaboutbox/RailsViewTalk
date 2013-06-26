class AddStateColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :registration_state, :string, null: false, default: 'initial'
  end
end
