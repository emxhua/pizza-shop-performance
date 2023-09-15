CREATE VIEW dashboardTwo AS
-- DASHBOARD 2: Inventory Management Calculations:
-- 1. Total Quantity by Ingredient (Number of Orders x Ingredient Quantity in Recipe)
-- 2. Total Cost of Ingredients
-- 3. Calculated Cost of Pizza
-- 4. Percentage Stock Remaining By Ingredient
-- 5. List of Ingredients To Re-order Based On Remaining Inventory
select
totalQuantity.item_name,
totalQuantity.ing_id,
totalQuantity.ing_name,
totalQuantity.ing_weight,
totalQuantity.ing_price,
totalQuantity.order_quantity,
totalQuantity.recipe_quantity,

totalQuantity.order_quantity*totalQuantity.recipe_quantity as ordered_weight,
totalQuantity.ing_price/totalQuantity.ing_weight as unit_cost,
(totalQuantity.order_quantity*totalQuantity.recipe_quantity)*(totalQuantity.ing_price/totalQuantity.ing_weight) as ingredient_cost

from (SELECT
	orders.item_id,
	item.sku,
	item.item_name,
	recipe.ing_id,
	ingredient.ing_name,
	recipe.quantity as recipe_quantity,
	sum(orders.quantity) as order_quantity,
	ingredient.ing_weight,
	ingredient.ing_price
FROM
	orders
	LEFT JOIN item on orders.item_id = item.item_id
	LEFT JOIN recipe on item.sku = recipe.recipe_id
	LEFT JOIN ingredient on ingredient.ing_id = recipe.ing_id
	GROUP BY orders.item_id, item.sku, item.item_name, recipe.ing_id, recipe.quantity, ingredient.ing_name, ingredient.ing_weight, ingredient.ing_price) totalQuantity