SELECT
	TOP (10000) 
	FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.SYSSystemID as system_id,
	FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.Urn as order_id,
	TxnDate as disp_date,
	FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Number as rx_num,
	FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic as rx_mnemonic,
	FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.NdcDinNumber as din,
	FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Dose as disp_dose,
	FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseUnit as disp_dose_unit,
	FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Sig as dose_frequency,
	TxnDoses as disp_num_doses,
	TxnItems as disp_qty,
	FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseForm as disp_form,
	FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseSize as disp_size,
	TxnInventory as disp_inventory,
	TxnCost as cost,
	TxnChargeType as charge_type,
	TxnLocation as disp_loc,
	TxnEntered as disp_start_timedate,
	TxnComplete as disp_fin_timedate,
	TxnOrderType as disp_med_type,
	FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med AS main_med_id,
	FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId as med_desc
FROM
	FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications ON FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.Urn
	INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.TxnMed
	INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.TxnMed
	INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxMain ON FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.Urn