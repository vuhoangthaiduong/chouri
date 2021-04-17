class AddUnitToNutritionsRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :nutritions_recipes, :unit, null: false, foreign_key: true
  end
end
