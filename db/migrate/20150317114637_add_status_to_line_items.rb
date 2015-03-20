class AddStatusToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :status, :string
  end
end
