class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :ip

      t.timestamps null: false
    end
    add_index :identities, :ip
  end
end
