class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.date :processing_date, null: false
      t.timestamps
    end
  end
end
