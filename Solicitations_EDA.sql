
select * from [dbo].[fs_Solicitations$]

-- find largest and smallest close date
select
	max([CloseDate])
	,min([CloseDate])
from [dbo].[fs_Solicitations$]

-- are solicitation numbers unique? how do they compare to Solicitation ID?
-- both Solicitation and SolicitationID are unique, unclear why they are both included as part of this dataset
select [Solicitation]
	,count([Solicitation]) 
from [dbo].[fs_Solicitations$]
group by [Solicitation]
order by count([Solicitation]) desc
	
select [SolicitationID]
	,count([SolicitationID]) 
from [dbo].[fs_Solicitations$]
group by [SolicitationID]
order by count([SolicitationID]) desc

-- 994 solicitations have a close date of 1900-01-01, is there a pattern to any of these
select
	count([CloseDate])
from [dbo].[fs_Solicitations$]
where [CloseDate] = '1900-01-01 00:00:00.000'
group by [CloseDate]

-- they all fall within "category 9", what do categories stand for?
-- average dollar value of 234K, max of 10M, min of 0.
select
	format(avg(A.[Estimate]),'c')
	,format(max(A.[Estimate]),'c') as max_value
	,format(min(A.[Estimate]),'c') as min_value
from	(select *
		from [dbo].[fs_Solicitations$]
		where [CloseDate] = '1900-01-01 00:00:00.000'
		) as A


-- three categories exist 7, 9, 10 - most are in category 9
-- categy 10 has average bid estimates of 3.5M
-- category 9 has average bid estimates of 91K
-- category 7 has no bid estimate value
select [Category]
	,count([Category])
	,format(avg([Estimate]),'c')
from [dbo].[fs_Solicitations$]
group by [Category]

-- cases where 'immediate' is included in the solicition description, there is only about 25 of these
-- most of these of these have close dates of 1900-01-01
-- this could indicate something critical has broken/malfunctioned, the city is bypasing the regular process 
select *
from [dbo].[fs_Solicitations$]
where [Description] like '%immediate%'
