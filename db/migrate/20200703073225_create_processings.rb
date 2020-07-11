class CreateProcessings < ActiveRecord::Migration[6.0]
  def change
    create_table :processings do |t|
      # t.date :day, null: false
      t.timestamps
    end
  end
end
