SELECT COUNT(*)
FROM raw.food_inspections;

SELECT *
FROM raw.food_inspections
LIMIT 5;

SELECT inspection_id, COUNT(*)
FROM raw.food_inspections
GROUP BY inspection_id
HAVING COUNT(*) > 1;

SELECT license_number, COUNT(DISTINCT TRIM(UPPER(dba_name)))
FROM raw.food_inspections
GROUP BY license_number
ORDER BY COUNT(DISTINCT dba_name) DESC;

SELECT DISTINCT dba_name
FROM raw.food_inspections
WHERE license_number = 14616;

SELECT DISTINCT facility_type
FROM raw.food_inspections;

SELECT DISTINCT risk
FROM raw.food_inspections;

SELECT DISTINCT city
FROM raw.food_inspections;

SELECT DISTINCT state
FROM raw.food_inspections;

SELECT DISTINCT inspection_type
FROM raw.food_inspections;

SELECT DISTINCT results
FROM raw.food_inspections;

SELECT violations
FROM raw.food_inspections
WHERE violations IS NOT NULL
LIMIT 5;
                                                                                                                                                                                                      | 59. PREVIOUS PRIORITY FOUNDATION VIOLATION CORRECTED - Comments: 8-404.13 (B)(3)  PREVIOUS PRIORITY FOUNDATION #38 NOT CORRECTED FROM REPORT #2588738 ON 1/29/24:   38 - IMPROPER PEST CONTROL. APPROX. 140 MOUSE DROPPINGS WERE OBSERVED THROUGHOUT THE SCHOOL. OBSERVED EVIDENCE OF RODENT ACTIVITY ON THE PREMISES IN THE FOLLOWING AREAS: 5 DROPPINGS ON THE FLOOR OF THE VAULT STORAGE ROOM IN THE PRINCIPAL'S OFFICE ROOM 100, 5 DROPPINGS IN THE CORNER OF RM. 111 NEAR THE STORAGE CABINETS, 5 DROPPINGS ON THE FLOOR IN RM. 104, 20 DROPPINGS IN THE CABINETS OF RM. 207, 20 DROPPINGS ON THE FLOOR AROUND THE GREASE TRAP IN RM. 207B, 30 DROPPINGS ON THE FLOOR'S CORNER AND BEHIND THE STOVES IN RM. 215, 5 DROPPINGS ON THE FLOOR IN RM. 209, 10 DROPPINGS ON THE FLOOR OF THE CLOSET IN ROOM 211D, 10 DROPPINGS ON THE WOODEN PALLETS IN RM. 137, AND 30 DROPPINGS ON THE STORAGE SHELVES OF THE LOCKERS ACROSS FROM THE FOOD SERVICE LINE. MANAGEMENT INSTRUCTED TO CLEAN AND REMOVE RODENT DROPPINGS FROM ALL AFFECTED AREAS THROUGHOUT THE SCHOOL. ADDITIONAL PEST CONTROL SERVICE IS NEEDED TO ELIMINATE THE PEST ACTIVITY THROUGHOUT.   PRIORITY VIOLATION 7-42-090.

SELECT violations,
       CAST(UNNEST(REGEXP_MATCHES(violations, '(?<=^|\|\s*)(\d+)\.', 'g')) AS INT) AS violation_code
FROM raw.food_inspections
WHERE violations = '37. FOOD PROPERLY LABELED; ORIGINAL CONTAINER - Comments: 3-302.12: FOOD STORAGE CONTAINERS NOT LABELED WITH COMMON NAME. INSTD TO LABEL WITH COMMON NAME AND MAINTAIN. | 47. FOOD & NON-FOOD CONTACT SURFACES CLEANABLE, PROPERLY DESIGNED, CONSTRUCTED & USED - Comments: 4-101.19: CARDBOARD LINING ON BOTTOM OF STORAGE SHELF IN REAR PREP AREA. INSTD TO REMOVE SO AS SURFACE TO BE SMOOTH AND EASILY CLEANABLE ';

SELECT DISTINCT CAST(UNNEST(REGEXP_MATCHES(violations, '(?<=^|\|\s*)(\d+)\.', 'g')) AS INT) AS violation_code
FROM raw.food_inspections
ORDER BY violation_code;
