/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
	TOP (1000) FHA_ANALYTICS.FHA.F_MeditechADMPatMain.SYSSystemID,
	FHA_ANALYTICS.FHA.F_MeditechADMPatMain.Urn,
	Id,
	AcctNumber,
	Name,
	STATUS,
	FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall.HealthCareNumber AS Phn,
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
	FHA_ANALYTICS.FHA.F_MeditechADMPatMain
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall ON FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall.Urn = APM.Urn
WHERE
	ServiceDate > 20170101