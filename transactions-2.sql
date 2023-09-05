/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
    TOP (1000) SYSSystemID SYSSystemID,
    Urn,
    TxnRx,
    --? orderid
    TxnDate,
    -- NOT USED date YYYYMMDD
    TxnPatient AS PatientId,
    --same as RXM.Patient
    TxnOrderType AS OrderType,
    --MED/MEDM/IVP etc.
    TxnDoses AS NumDoses,
    TxnCharge AS Charge,
    TxnBillingCode AS BillingCode,
    TxnUser AS DispUser,
    TxnMed AS MedMnemonic,
    TxnItems AS NumItems,
    TxnInventory AS Inventor,
    y -- ?ADC/PHARM
    TxnCost AS Cost,
    TxnChargeType AS ChargeType,
    TxnDispForms AS NumDoseForm,
    TxnLocation AS DispLocation,
    SYSStartTime,
    SYSEndTime,
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions