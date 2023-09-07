SELECT
    TOP (100) F_MeditechPHARxMain.SYSSystemID as system_id,
    Number as order_id,
    Patient as patient_id,
    EnterDate as enter_date,
    EnterTime as enter_time,
    EnterUser as enter_user,
    DcDate as stop_date,
    DcTime as stop_time,
    OrderType as order_type,
    Status as order_status,
    F_MeditechPHARxCompoundIngredients.IngredientQ as ingred_number,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.NdcDinNumber as ingred_din,
    F_MeditechPHARxCompoundIngredients.Ingredient as ingred_mnemonic,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId as ingred_desc,
    F_MeditechPHARxCompoundIngredients.IngredientDose as ingred_dose,
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.DispenseForm as disp_form,
    Sig as frequency,
    Schedule as schedule,
    Route as route,
    StartDate as start_date,
    StartTime as start_time,
    StopDate as stop_date,
    StopTime as stop_time,
    Physician as provider_mnemonic,
    StopDateOrig as stop_date_orig
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxCompoundIngredients ON F_MeditechPHARxMain.Urn COLLATE DATABASE_DEFAULT = F_MeditechPHARxCompoundIngredients.Urn COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.F_MeditechPHARxCompoundIngredients.Ingredient COLLATE DATABASE_DEFAULT = FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic COLLATE DATABASE_DEFAULT = FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic COLLATE DATABASE_DEFAULT
WHERE
    F_MeditechPHARxMain.OrderType = 'COMP' --compounded meds only