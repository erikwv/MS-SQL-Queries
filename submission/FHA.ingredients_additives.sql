SELECT
    Number as order_id,
    F_MeditechPHARxIVAdditives.AdditiveQ as additive_number,
    D_MeditechPHADrugMain.NdcDinNumber as additive_din,
    F_MeditechPHARxIvAdditives.Additive as additive_id,
    D_MeditechPHADrugMain5.DrugId as additive_desc,
    F_MeditechPHARxIvAdditives.AdditiveDose as additive_dose,
    D_MeditechPHADrugMain.DispenseForm as additive_dose_units
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxIvAdditives ON F_MeditechPHARxMain.Urn COLLATE DATABASE_DEFAULT = F_MeditechPHARxIvAdditives.Urn COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON F_MeditechPHARxIvAdditives.Additive COLLATE DATABASE_DEFAULT = D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON D_MeditechPHADrugMain5.Mnemonic COLLATE DATABASE_DEFAULT = D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
WHERE
    OrderType LIKE 'IV%'