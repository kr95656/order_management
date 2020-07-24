class CreateProcessings < ActiveRecord::Migration[6.0]
  def change
    create_table :processings do |t|

      t.timestamps
    end
  end
end
