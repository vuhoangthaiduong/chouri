class CreateJoinTableIngredientsNutritions < ActiveRecord::Migration[6.1]
  def change
    create_join_table :ingredients, :nutritions do |t|
      # t.index [:ingredient_id, :nutrition_id]
      # t.index [:nutrition_id, :ingredient_id]
    end
  end
end
