class CreateExportableModels < ActiveRecord::Migration[5.0]
  def change
    create_table :exportable_models do |t|
      t.string :field_string
      t.binary :field_binary
      t.date :field_date
      t.datetime :field_datetime
      t.decimal :field_decimal
      t.float :field_float
      t.integer :field_integer
      t.bigint :field_bigint
      t.text :field_text
      t.time :field_time
      t.timestamps
    end
  end
end
