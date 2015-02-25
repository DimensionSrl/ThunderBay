class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :receiver_id
      t.integer :sender_id
      t.string :category
      t.string :title
      t.string :question
      t.string :reply
      t.boolean :deleted
      t.boolean :sent
      t.boolean :received
      t.boolean :red

      t.timestamps null: false
    end
  end
end
