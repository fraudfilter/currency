class AddExpiredField < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :expired_date, :datetime
  end
end
