class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :fortune_id
      t.string :author
      t.string :body

      t.timestamps
    end
  end
end
