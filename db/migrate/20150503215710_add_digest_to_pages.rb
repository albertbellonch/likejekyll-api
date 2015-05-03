class AddDigestToPages < ActiveRecord::Migration
  def change
    add_column :pages, :digest, :string
  end
end
