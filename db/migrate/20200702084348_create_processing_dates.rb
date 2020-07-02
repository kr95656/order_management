class CreateProcessingDates < ActiveRecord::Migration[6.0]
  def change
    create_table :processing_dates do |t|
      t.timestamps
    end
  end
end
