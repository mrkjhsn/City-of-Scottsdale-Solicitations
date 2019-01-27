
select * from [dbo].[fs_Solicitations$]
--
-- find largest and smallest close date
select
	max([CloseDate])
	,min([CloseDate])
from [dbo].[fs_Solicitations$]
------------------
select
	min([CloseDate])
from [dbo].[fs_Solicitations$]
where [CloseDate] not like '1900-01-01 00:00:00.000'

select
	[CloseDate]
from [dbo].[fs_Solicitations$]
order by [CloseDate]

