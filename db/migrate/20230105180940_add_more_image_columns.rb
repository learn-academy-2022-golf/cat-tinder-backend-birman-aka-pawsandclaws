class AddMoreImageColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :cats, :image2, :text
    add_column :cats, :image3, :text
    add_column :cats, :image4, :text

  end
end
