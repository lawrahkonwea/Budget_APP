class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|

      t.timestamps
    end
  end
end
