class CreateExpirationDates < ActiveRecord::Migration[6.0]
  def change
    create_table :expiration_dates do |t|
      # t.date :day, null: false
      t.timestamps
    end
  end
end
