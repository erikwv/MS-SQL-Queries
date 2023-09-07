SELECT
	F_MeditechPHARxMain.SYSSystemID AS system_id,
	F_MeditechPHARxMain.Number AS order_id,
	D_MeditechMISLocnMain.OeSite AS site_id,
	F_MeditechADMPatMain.Location AS nurse_unit,
	Patient AS patient_id,
	--FHA account number
	F_MeditechPHARxMain.Status AS order_status,
	F_MeditechPHARxInpatientMedications.Med AS product_mnemonic,
	D_MeditechPHADrugMain5.DrugId AS product_desc,
	D_MeditechPHADrugMain.NdcDinNumber AS din,
	OrderType AS order_type,
	F_MeditechPHARxCompoundIngredients.Ingredient as ingredient_id,
	F_MeditechPHARxInpatientMedications.Dose AS strength_dose,
	D_MeditechPHADrugMain.DispenseUnit AS strength_dose_unit,
	D_MeditechPHADrugMain.DispenseForm AS dosage_form,
	Route AS route,
	Sig AS frequency,
	EnterDate AS enter_date,
	EnterTime AS emter_time,
	DcDate AS orig_stop_dt,
	DcTime AS orig_stop_tm,
	StartDate AS order_start_dt,
	StartTime AS order_start_tm,
	StopDate AS order_stop_dt,
	StopTime AS order_stop_tm,
	Physician AS prescriber_mnemonic,
	FHA_ANALYTICS.FHA.D_MeditechMISDocMain.Name AS prescriber_full_name
FROM
	FHA_ANALYTICS.FHA.F_MeditechPHARxMain
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications ON F_MeditechPHARxInpatientMedications.Urn = F_MeditechPHARxMain.Urn
	INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON D_MeditechPHADrugMain.Mnemonic = F_MeditechPHARxInpatientMedications.Med
	INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON D_MeditechPHADrugMain5.Mnemonic = F_MeditechPHARxInpatientMedications.Med
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechADMPatMain ON F_MeditechADMPatMain.Urn = F_MeditechPHARxMain.Patient
	INNER JOIN FHA_ANALYTICS.FHA.D_MeditechMISLocnMain ON D_MeditechMISLocnMain.Mnemonic = F_MeditechADMPatMain.Location
	INNER JOIN FHA_ANALYTICS.FHA.D_MeditechMISDocMain ON D_MeditechMISDocMain.Mnemonic = F_MeditechPHARxMain.Physician
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxCompoundIngredients ON F_MeditechPHARxMain.Urn COLLATE DATABASE_DEFAULT = F_MeditechPHARxCompoundIngredients.Urn COLLATE DATABASE_DEFAULT