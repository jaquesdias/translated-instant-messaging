class AddDialectTypeToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :dialect_type, :string
  end
end
