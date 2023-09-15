-- DASHBOARD 1
SELECT 
	orders.order_id, 
	item.item_price, 
	orders.quantity, 
	item.item_cat, 
	item.item_name, 
	orders.created_at, 
	addresses.delivery_address1, 
	addresses.delivery_address2, 
	addresses.delivery_city, 
	addresses.delivery_zipcode, 
	orders.delivery
FROM 
	orders
	LEFT JOIN item on orders.item_id = item.item_id
	LEFT JOIN addresses on orders.add_id = addresses.add_id;