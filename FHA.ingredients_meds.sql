SELECT
    TOP (1000)
    Number as order_id,
    F_MeditechPHARxCompoundIngredients.IngredientQ as ingred_number,
    D_MeditechPHADrugMain.NdcDinNumber as ingred_din,
    F_MeditechPHARxCompoundIngredients.Ingredient as ingred_id,
    D_MeditechPHADrugMain5.DrugId as ingred_desc,
    F_MeditechPHARxCompoundIngredients.IngredientDose as ingred_dose,
    D_MeditechPHADrugMain.DispenseForm as ingred_dose_units
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxCompoundIngredients ON F_MeditechPHARxMain.Urn COLLATE DATABASE_DEFAULT = F_MeditechPHARxCompoundIngredients.Urn COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON F_MeditechPHARxCompoundIngredients.Ingredient COLLATE DATABASE_DEFAULT = D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON D_MeditechPHADrugMain5.Mnemonic COLLATE DATABASE_DEFAULT = D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
WHERE
    F_MeditechPHARxMain.OrderType = 'COMP' --compounded meds only