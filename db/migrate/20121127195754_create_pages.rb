class CreatePages < ActiveRecord::Migration
  def change

     create_table :pages do |t|
      t.string :id_hash,          :null => false

      t.string  :title,            :null => false
      t.string  :glyph
      t.string  :desc
      t.integer :order

      t.text    :content

      t.string  :slug

      t.integer :pageable_id
      t.string  :pageable_type
      

      t.timestamps
    end
    add_index :pages, :id_hash,   :unique => true
    add_index :pages, :slug
  end
end



