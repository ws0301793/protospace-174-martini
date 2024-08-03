class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :name
      t.string :catch_copy
      t.text :concept
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
