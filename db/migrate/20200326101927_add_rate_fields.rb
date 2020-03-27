class AddRateFields < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :value, :string
    add_column :rates, :jid, :string
  end
end
