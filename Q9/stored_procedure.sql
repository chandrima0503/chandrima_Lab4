delimiter &&
create procedure displaySupplierDetails()
Begin
select s.SUPP_ID as Supplier_Id,s.SUPP_NAME as Supplier_Name, avg(a.RAT_RATSTARS) as rating, 
Case
	when avg(a.RAT_RATSTARS)=5 then "Excellent Service"
    when avg(a.RAT_RATSTARS)>4 then "Good Service"
    when avg(a.RAT_RATSTARS)>2 then "Avg Service"
    else "Poor Service" end
    as Type_of_service from supplier s 
    inner join  
		(
			select q.ORD_ID,q.PRICING_ID,s.SUPP_ID, q.RAT_RATSTARS from supplier_pricing s 
            inner join
			(
				select o.PRICING_ID,r.RAT_RATSTARS,r.ORD_ID from rating r,`order` o where r.ORD_ID=o.ORD_ID
			) as Q on q.PRICING_ID=s.PRICING_ID order by ORD_ID
		) as A on a.SUPP_ID=s.SUPP_ID group by Supplier_Id;displaySupplierDetails
End //
DELIMITER ;

call displaySupplierDetails;