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
    F_MeditechPHARxCompoundIngredients.IngredientQ as ingred_number,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.NdcDinNumber as ingred_din,
    F_MeditechPHARxCompoundIngredients.Ingredient as ingred_id,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId as ingred_desc,
    F_MeditechPHARxCompoundIngredients.IngredientDose as ingred_dose,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseForm as ingred_dose_units
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxCompoundIngredients ON F_MeditechPHARxMain.Urn COLLATE DATABASE_DEFAULT = F_MeditechPHARxCompoundIngredients.Urn COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.F_MeditechPHARxCompoundIngredients.Ingredient COLLATE DATABASE_DEFAULT = FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic COLLATE DATABASE_DEFAULT = FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
WHERE
    F_MeditechPHARxMain.OrderType = 'COMP' --compounded meds only