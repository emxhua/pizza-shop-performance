SELECT
	rota.date,
	staff.first_name,
	staff.last_name,
	staff.hourly_rate,
	shifts.start_time,
	shifts.end_time,
	DATEDIFF(MINUTE, shifts.start_time, shifts.end_time) / 60.0 AS shiftHours,
    (DATEDIFF(MINUTE, shifts.start_time, shifts.end_time) / 60.0) * staff.hourly_rate AS staffCosts
FROM rota
	LEFT JOIN staff on rota.staff_id = staff.staff_id
	LEFT JOIN shifts on rota.shifts_id = shifts.shifts_id
