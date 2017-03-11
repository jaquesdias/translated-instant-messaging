class AddCreatedAtToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :created_at, :datetime
  end
end
