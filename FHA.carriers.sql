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
    F_MeditechPHARxCarriers.CarrierQ as carrier_number,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.NdcDinNumber as carrier_din,
    F_MeditechPHARxCarriers.Carrier as carrier_id,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId as carrier_desc,
    F_MeditechPHARxCarriers.CarrierVolume as carrier_volume,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseForm as carrier_disp_form
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxCarriers ON F_MeditechPHARxMain.Urn COLLATE DATABASE_DEFAULT = F_MeditechPHARxCarriers.Urn COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.F_MeditechPHARxCarriers.Carrier COLLATE DATABASE_DEFAULT = FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic COLLATE DATABASE_DEFAULT = FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
WHERE
    OrderType LIKE 'IV%'