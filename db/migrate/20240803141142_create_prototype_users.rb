class CreatePrototypeUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :prototype_users do |t|
      t.references :prototype, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
