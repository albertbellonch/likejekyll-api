class IndexPagesOnDigestNotUri < ActiveRecord::Migration
  def change
    remove_index :pages, :uri
    add_index :pages, :digest
  end
end
