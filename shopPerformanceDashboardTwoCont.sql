SELECT
totalWeightInv.ing_name,
totalWeightInv.ordered_weight,
ingredient.ing_weight*inventory.quantity as total_inv_weight,
(ingredient.ing_weight * inventory.quantity)-totalWeightInv.ordered_weight as remaining_weight
FROM (SELECT
ing_id,
ing_name,
	sum(ordered_weight) as ordered_weight
FROM
	dashboardTwo
	GROUP BY ing_name, ing_id) totalWeightInv

LEFT JOIN inventory on inventory.item_id = totalWeightInv.ing_id
LEFT JOIN ingredient on ingredient.ing_id = totalWeightInv.ing_id