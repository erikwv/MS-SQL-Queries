SELECT
	TOP (10000)
	F_MeditechPHARxMain.Number as order_id,
	TxnDate as disp_date,
	D_MeditechPHADrugMain.Mnemonic as drug_mnemonic,
	D_MeditechPHADrugMain.NdcDinNumber as din,
	F_MeditechPHARxInpatientMedications.Dose as disp_dose,
	D_MeditechPHADrugMain.DispenseUnit as disp_dose_unit,
	F_MeditechPHARxMain.Sig as dose_frequency,
	TxnDoses as disp_num_doses,
	TxnItems as disp_qty,
	D_MeditechPHADrugMain.DispenseForm as disp_form,
	D_MeditechPHADrugMain.DispenseSize as disp_size,
	TxnInventory as disp_inventory,
	TxnCost as cost,
	TxnChargeType as charge_type,
	TxnLocation as disp_loc,
	TxnEntered as disp_start_timedate,
	TxnComplete as disp_fin_timedate,
	TxnOrderType as disp_med_type,
	F_MeditechPHARxInpatientMedications.Med AS main_med_id,
	D_MeditechPHADrugMain5.DrugId as med_desc
FROM
	FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications ON F_MeditechPHARxInpatientMedications.Urn = F_MeditechPHARxTransactions.Urn
	INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON D_MeditechPHADrugMain.Mnemonic = F_MeditechPHARxTransactions.TxnMed
	INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON D_MeditechPHADrugMain5.Mnemonic = F_MeditechPHARxTransactions.TxnMed
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxMain ON F_MeditechPHARxMain.Urn = F_MeditechPHARxTransactions.Urn