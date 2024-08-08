class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :prototype, foreign_key: true
      t.integer :user_id
      t.integer :prototype_id
      t.text :text
      t.timestamps

      t.timestamps
    end
  end
end
