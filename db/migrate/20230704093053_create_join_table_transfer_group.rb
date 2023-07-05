class CreateJoinTableTransferGroup < ActiveRecord::Migration[7.0]
  def change
    create_join_table :transfers, :groups do |t|
      t.index [:transfer_id, :group_id]
      t.index [:group_id, :transfer_id]
    end
  end
end
