class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :seo_title
      t.text :seo_descr
      t.string :seo_keywords
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
