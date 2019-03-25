-- how many different types of solicitation types are there?
-- 13 types in all, Public Bid being the highest
select [SoliciationType]
	,count([SoliciationType]) _count_
	,format(avg([Estimate]),'c') _avg_
from [dbo].[fs_Solicitations$]
group by [SoliciationType]
order by count([SoliciationType]) desc

-- of the 13 types of solicitions, what is the distribution across the years?
select 
	year(A.[CloseDate]) as _Year_
	,B.EmergencyPurchase
	,C.PublicBid
	,D.Sole_Source
	,E.Other_Government_Contract
	,F.Request_For_Proposal
	,G.Request_For_Quotation
	,H.Pricing_Agreement
	,I.Informal_Request_For_Proposal
	,J.Statement_of_Qualifications
	,K.Offer_to_Purchase
	,L.Sole_Source_Exclusion_of_Alternates
	,M.Request_For_Qualifications
	,N.Request_For_Information

from [dbo].[fs_Solicitations$] as A
left join (select
			year([CloseDate]) as _Year_
			,count(*) as EmergencyPurchase
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Emergency Purchase'
			group by year([CloseDate])) as B on B._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as PublicBid
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Public Bid'
			group by year([CloseDate])) as C on C._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Sole_Source
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Sole Source'
			group by year([CloseDate])) as D on D._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Other_Government_Contract
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Other Government Contract'
			group by year([CloseDate])) as E on E._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Request_For_Proposal
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Request For Proposal'
			group by year([CloseDate])) as F on F._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Request_For_Quotation
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Request For Quotation'
			group by year([CloseDate])) as G on G._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Pricing_Agreement
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Pricing Agreement'
			group by year([CloseDate])) as H on H._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Informal_Request_For_Proposal
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Informal Request For Proposal'
			group by year([CloseDate])) as I on I._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Statement_of_Qualifications
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Statement of Qualifications'
			group by year([CloseDate])) as J on J._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Offer_to_Purchase
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Offer to Purchase'
			group by year([CloseDate])) as K on K._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Sole_Source_Exclusion_of_Alternates
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Sole Source Exclusion of Alternates'
			group by year([CloseDate])) as L on L._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Request_For_Qualifications
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Request For Qualifications'
			group by year([CloseDate])) as M on M._Year_ = year(A.[CloseDate])
left join (select
			year([CloseDate]) as _Year_
			,count(*) as Request_For_Information
			from [dbo].[fs_Solicitations$]
			where [SoliciationType] like 'Request For Information'
			group by year([CloseDate])) as N on N._Year_ = year(A.[CloseDate])
			
group by year([CloseDate]), B.EmergencyPurchase, C.PublicBid, D.Sole_Source, E.Other_Government_Contract
	,F.Request_For_Proposal ,G.Request_For_Quotation ,H.Pricing_Agreement ,I.Informal_Request_For_Proposal
	,J.Statement_of_Qualifications ,K.Offer_to_Purchase ,L.Sole_Source_Exclusion_of_Alternates ,M.Request_For_Qualifications
	,N.Request_For_Information
order by year(A.[CloseDate]) desc
