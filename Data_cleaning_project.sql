select * from layoffs ; 
select * from stage_layoffs_2;
-- Duplicates data 
-- Null Values 
-- Standradize Data 
-- Remove any coulmns or rows



-- Cteating new similar table 
create table stage_layoffs 
like layoffs ; 
insert stage_layoffs select * from layoffs; 


-- Removing Duplicates 

With duplicates_cte as 

(
select *,
row_number() over(partition by company, location ,industry , total_laid_off , percentage_laid_off , stage,  country ,  funds_raised_millions,'date') as row_num
from stage_layoffs 
) 
select * from duplicates_cte 
where row_num > 1 ; 
 
 
 -- Standradize Data 
  
 update stage_layoffs_2 
 set company = trim(company); 
 


UPDATE stage_layoffs_2 
SET industry = 'Crypto'
WHERE industry = 'CryptoCurrency';


select location  from stage_layoffs_2
order by 1 
; 

update stage_layoffs_2 
set country = 'United States'
where country = 'United States.';

select `date` ,
str_to_date(`date` , '%m/%d/%Y') as `date`
 from stage_layoffs_2
 ;
 
 -- Here we changed the date formula but still in schemas not.
 update stage_layoffs_2 
 set `date` = str_to_date(`date` , '%m/%d/%Y') ; 
 
 
 -- To change the formula of the coulmn in the schemas.
 alter table stage_layoffs_2 
 modify column `date`date;
 
 select  * from stage_layoffs_2
 where total_laid_off is null and percentage_laid_off is null 
 ;

-- We have deleted the rows that contains null values in percentage_laid_off and total_laid_off 
 delete from stage_layoffs_2
 where total_laid_off is null and percentage_laid_off is null 
 ;
 
 -- After removing duplicates now we will remove row_num column 
 alter table stage_layoffs_2
 drop column row_num;
 

 -- Still have null values to remvoe (Done)
 -- Change the stage_layoffs_2 give it other name. (Done)
 

 
