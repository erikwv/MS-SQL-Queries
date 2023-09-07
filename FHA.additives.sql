SELECT
    TOP (1000) F_MeditechPHARxMain.SYSSystemID as system_id,
    Number as order_id,
    EnterDate as enter_date,
    EnterTime as enter_time,
    DcDate as stop_date,
    DcTime as stop_time,
    StopDateOrig as stop_date_orig,
    OrderType as order_type,
    Status as order_status,
    F_MeditechPHARxIVAdditives.AdditiveQ as additive_number,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.NdcDinNumber as additive_din,
    F_MeditechPHARxIvAdditives.Additive as additive_id,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId as additive_desc,
    F_MeditechPHARxIvAdditives.AdditiveDose as additive_dose,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseForm as additive_dose_units,
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxIvAdditives ON F_MeditechPHARxMain.Urn COLLATE DATABASE_DEFAULT = F_MeditechPHARxIvAdditives.Urn COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.F_MeditechPHARxIvAdditives.Additive COLLATE DATABASE_DEFAULT = FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic COLLATE DATABASE_DEFAULT = FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
WHERE
    OrderType LIKE 'IV%'