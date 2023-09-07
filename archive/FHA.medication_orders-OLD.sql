-- query with patient data merged into orders query
SELECT
    TOP (1000) FHA_ANALYTICS.FHA.F_MeditechPHARxMain.SYSSystemID AS system_id,
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Number AS order_id,
    FHA_ANALYTICS.FHA.D_MeditechMISLocnMain.OeSite AS site_id,
    FHA_ANALYTICS.FHA.F_MeditechADMPatMain.Location AS nurse_unit,
    Patient AS patient_id,
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Status AS order_status,
    FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med AS product_mnemonic,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId AS product_desc,
    OrderType AS order_type,
    FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Dose AS dose,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseUnit AS dose_unit,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseForm AS dosage_form,
    Route AS route,
    Sig AS frequency,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.NdcDinNumber AS din,
    EnterDate AS enter_date,
    EnterTime AS emter_time,
    DcDate AS orig_stop_dt,
    DcTime AS orig_stop_tm,
    StartDate AS order_start_dt,
    StartTime AS order_start_tm,
    StopDate AS order_stop_dt,
    StopTime AS order_stop_tm,
    FHA_ANALYTICS.FHA.F_MeditechADMPatMain.Name AS name_full,
    FHA_ANALYTICS.FHA.F_MeditechADMPatMain.Birthdate AS dob,
    FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall.HealthCareNumber AS phn,
    Physician AS prescriber_mnemonic,
    FHA_ANALYTICS.FHA.D_MeditechMISDocMain.Name AS prescriber_full_name
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications ON FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Urn
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechADMPatMain ON FHA_ANALYTICS.FHA.F_MeditechADMPatMain.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Patient
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechMISLocnMain ON FHA_ANALYTICS.FHA.D_MeditechMISLocnMain.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechADMPatMain.Location
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechMISDocMain ON FHA_ANALYTICS.FHA.D_MeditechMISDocMain.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Physician
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall ON FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Patient