class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :uri

      t.timestamps null: false
    end
    add_index :pages, :uri
  end
end
