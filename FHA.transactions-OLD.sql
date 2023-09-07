TxnLocation,
-- dispense location
TxnEntered,
-- datetime entered
TxnComplete,
-- datetime complete
TxnOrderType,
-- MED/MEDM/IVP etc.
FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Med AS main_med_id,
FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugId,
FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.DrugGenericName
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications ON FHA_ANALYTICS.FHA.F_MeditechPHARxInpatientMedications.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.Urn
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.TxnMed
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5 ON FHA_ANALYTICS.FHA.D_MeditechPHADrugMain5.Mnemonic = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.TxnMed
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechPHARxMain ON FHA_ANALYTICS.FHA.F_MeditechPHARxMain.Urn = FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.Urn
WHERE
    FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions.SYSSystemID = 'MC'
    AND TxnDate > 20210101