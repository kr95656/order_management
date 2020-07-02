class AddProcessingDateRefToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :processing_date, null: false, foreign_key: true
  end
end
