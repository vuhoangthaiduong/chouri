class AddUnitToIngredientsNutritions < ActiveRecord::Migration[6.1]
  def change
    add_reference :ingredients_nutritions, :unit, null: false, foreign_key: true
  end
end
