class AddInformationsToUrl < ActiveRecord::Migration
  def change
    add_column :messages, :url, :string
    add_column :messages, :badge, :integer
    add_column :messages, :sound, :string
  end
end
