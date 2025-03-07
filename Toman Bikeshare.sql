-- Common Table Expression (CTE) for combining bike share data  
WITH bike_share_CTE AS (  
    SELECT * FROM bike_share_yr_0  
    UNION  
    SELECT * FROM bike_share_yr_1  
)  

-- Selecting relevant columns and calculating revenue and profit  
select  dteday,season,bsc.yr,weekday,
    hr,rider_type,riders,price,COGS,
    riders*price AS revenue,
    riders*price -COGS*riders AS profit 

FROM bike_share_CTE bsc  
LEFT JOIN cost_table ct  
    ON bsc.yr = ct.yr;