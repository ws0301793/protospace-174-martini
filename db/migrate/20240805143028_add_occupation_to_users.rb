class AddOccupationToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:users, :occupation)
      add_column :users, :occupation, :string
    end
  end
end
