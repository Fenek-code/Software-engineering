class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
