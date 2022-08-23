select sup.SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE from supplier as sup
inner join
(
	select *  from supplier_pricing group by supp_id having count(supp_id)>1
) as sp on sup.SUPP_ID = sp.SUPP_ID;