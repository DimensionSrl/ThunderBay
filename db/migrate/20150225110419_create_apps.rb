class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :key
      t.string :identifier
      t.string :environment
      t.string :password
      t.text :certificate

      t.timestamps null: false
    end
  end
end
