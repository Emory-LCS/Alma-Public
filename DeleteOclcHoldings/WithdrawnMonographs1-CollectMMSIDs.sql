SELECT
   0 s_0,
   "Physical Items"."Bibliographic Details"."Material Type" s_1,
   "Physical Items"."Bibliographic Details"."MMS Id" s_2,
   "Physical Items"."Location"."Library Code" s_3,
   "Physical Items"."Location"."Location Code" s_4,
   "Physical Items"."Physical Item Details"."Barcode" s_5,
   "Physical Items"."Physical Item Details"."Life Cycle" s_6,
   "Physical Items"."Physical Item Details"."Modification Date" s_7,
   CASE WHEN UPPER("Physical Items"."Bibliographic Details"."Network Number") LIKE '%OCOLC%' THEN REPLACE(LEFT(SUBSTRING("Physical Items"."Bibliographic Details"."Network Number" FROM LOCATE('(OCOLC',UPPER("Physical Items"."Bibliographic Details"."Network Number"))),LOCATE(' ',SUBSTRING(CONCAT("Physical Items"."Bibliographic Details"."Network Number",'; ') FROM LOCATE('(OCOLC',UPPER("Physical Items"."Bibliographic Details"."Network Number"))))),';','') WHEN UPPER("Physical Items"."Bibliographic Details"."Network Number") LIKE '%OCM%' THEN REPLACE(LEFT(SUBSTRING("Physical Items"."Bibliographic Details"."Network Number" FROM LOCATE('OCM',UPPER("Physical Items"."Bibliographic Details"."Network Number"))),LOCATE(' ',SUBSTRING(CONCAT("Physical Items"."Bibliographic Details"."Network Number",'; ') FROM LOCATE('OCM',UPPER("Physical Items"."Bibliographic Details"."Network Number"))))),';','') WHEN UPPER("Physical Items"."Bibliographic Details"."Network Number") LIKE '%OCN%' THEN REPLACE(LEFT(SUBSTRING("Physical Items"."Bibliographic Details"."Network Number" FROM LOCATE('OCN',UPPER("Physical Items"."Bibliographic Details"."Network Number"))),LOCATE(' ',SUBSTRING(CONCAT("Physical Items"."Bibliographic Details"."Network Number",'; ') FROM LOCATE('OCN',UPPER("Physical Items"."Bibliographic Details"."Network Number"))))),';','') WHEN UPPER("Physical Items"."Bibliographic Details"."Network Number") LIKE '%ON%' THEN REPLACE(LEFT(SUBSTRING("Physical Items"."Bibliographic Details"."Network Number" FROM LOCATE('OCN',UPPER("Physical Items"."Bibliographic Details"."Network Number"))),LOCATE(' ',SUBSTRING(CONCAT("Physical Items"."Bibliographic Details"."Network Number",'; ') FROM LOCATE('OCN',UPPER("Physical Items"."Bibliographic Details"."Network Number"))))),';','') ELSE 'No OCLC Number Available' END s_8
FROM "Physical Items"
WHERE
(("Location"."Library Code" IN ('BUS', 'CHEM', 'MUSME', 'UNIV')) AND ("Location"."Location Code" = 'WD') AND ("Physical Item Details"."Life Cycle" <> 'Deleted') AND ("Physical Item Details"."Modification Date" >= (TIMESTAMPADD(SQL_TSI_DAY, -1, CURRENT_DATE))) AND ("Bibliographic Details"."Material Type" = 'Book'))
