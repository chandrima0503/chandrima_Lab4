select `order`.ORD_ID, `order`.CUS_ID, product.PRO_NAME from `order`
join supplier_pricing as sp
on sp.PRICING_ID = `order`.PRICING_ID
join product
on product.PRO_ID = sp.PRO_ID
where `order`.CUS_ID = 2;