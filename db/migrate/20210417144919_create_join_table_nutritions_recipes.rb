class CreateJoinTableNutritionsRecipes < ActiveRecord::Migration[6.1]
  def change
    create_join_table :nutritions, :recipes do |t|
      # t.index [:recipe_id, :nutrition_id]
      # t.index [:nutrition_id, :recipe_id]
    end
  end
end
