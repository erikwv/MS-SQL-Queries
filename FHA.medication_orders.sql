SELECT
    TOP (1000) FHA_ANALYTICS.FHA.F_MeditechPHARxMain.SYSSystemID,
    Number AS order_id,
    Patient AS patient_id,
    FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med AS main_med_id,
    FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Dose,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId,
    Sig,
    OrderType,
    STATUS,
    Schedule,
    Route,
    EnterDate,
    EnterTime,
    DcDate,
    DcTime,
    StartDate,
    StartTime,
    StopDate,
    StopTime,
    Physician,
    SoftStop,
    TotalDoses,
    StopDateOrig,
    NewRx
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications ON FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Urn
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med