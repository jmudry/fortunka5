class CreateFortunes < ActiveRecord::Migration
  def change
    create_table :fortunes do |t|
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
