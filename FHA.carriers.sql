SELECT
    TOP (1000)
    Number as order_id,
    F_MeditechPHARxCarriers.CarrierQ as carrier_number,
    D_MeditechPHADrugMain.NdcDinNumber as carrier_din,
    F_MeditechPHARxCarriers.Carrier as carrier_id,
    D_MeditechPHADrugMain5.DrugId as carrier_desc,
    F_MeditechPHARxCarriers.CarrierVolume as carrier_volume,
    D_MeditechPHADrugMain.DispenseForm as carrier_disp_form
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxCarriers ON F_MeditechPHARxMain.Urn COLLATE DATABASE_DEFAULT = F_MeditechPHARxCarriers.Urn COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON F_MeditechPHARxCarriers.Carrier COLLATE DATABASE_DEFAULT = D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON D_MeditechPHADrugMain5.Mnemonic COLLATE DATABASE_DEFAULT = D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
WHERE
    OrderType LIKE 'IV%'