

class CreateStatements < ActiveRecord::Migration[5.1]
  def change
    drop_table :statements
    create_table :statements do |t|
      t.text :evidence

      t.timestamps
    end
  end
end
