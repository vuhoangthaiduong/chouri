class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
