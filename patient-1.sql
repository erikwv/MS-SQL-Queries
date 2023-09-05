/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
	TOP (1000) APM.SYSSystemID APM.Urn,
	Id,
	AcctNumber,
	Name,
	STATUS,
	CANREC.HealthCareNumber AS Phn,
	UnitNumber,
	MriUrn,
	Birthdate,
	Sex,
	Service,
	Location,
	OutpatientLocation,
	InpatientLocation,
	AdmitDate,
	AdmitTime,
	AdmitDateTime,
	ServiceDate,
	ServiceTime,
	ServiceDateTime,
	DischargeDate,
	DischargeTime,
	DischargeDateTime,
	SuppressEmr,
	OutpatientService,
	OutpatientPriorLocation,
	LoaStatus
FROM
	FHA_ANALYTICS.FHA.F_MeditechADMPatMain AS APM
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall AS CANREC ON CANREC.Urn = APM.Urn
WHERE
	ServiceDate > 20170101