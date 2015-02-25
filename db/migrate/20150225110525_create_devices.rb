class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :identifier
      t.string :token
      t.string :app_id
      t.datetime :last_access
      t.float :lat, :limit => 30
      t.float :lon, :limit => 30
      t.string :locale
      t.string :name

      t.timestamps null: false
    end
  end
end
