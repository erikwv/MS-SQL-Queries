/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
    TOP (1000) SYSSystemID Urn,
    TxnDate,
    -- NOT USED date YYYYMMDD
    TxnQ,
    -- NOT USED
    TxnType,
    -- NOT USED
    TxnPatient AS PatientId,
    --same as RXM.Patient
    TxnRx,
    -- NOT USED
    TxnEntered,
    -- NOT USED datetime entered
    TxnComplete,
    -- NOT USED datetime complete
    TxnOrderType AS OrderType,
    --MED/MEDM/IVP etc.
    TxnDoses AS NumDoses,
    TxnCharge AS Charge,
    TxnBillingCode AS BillingCode,
    TxnUser AS DispUser,
    TxnMed AS MedMnemonic,
    TxnItems AS NumItems,
    TxnCtrl,
    -- NOT USED ? for C2s?
    TxnService,
    -- NOT USED
    TxnInventory AS Inventory,
    -- ?ADC/PHARM
    TxnCost AS Cost,
    TxnAccount,
    -- NOT USED
    TxnChargeType AS ChargeType,
    TxnDispForms AS NumUnits,
    TxnBottleType,
    -- NOT USED
    TxnRtnFlag,
    -- NOT USED
    TxnServiceSeconds,
    -- NOT USED
    TxnBatchTime,
    -- NOT USED
    TxnAdjInsurance,
    -- NOT USED
    TxnAdjAmtPaid,
    -- NOT USED
    TxnAdjOthInsurance,
    -- NOT USED
    TxnAdjOthAmtPaid,
    -- NOT USED
    TxnBillingCodeFlag,
    -- NOT USED
    TxnLocation AS DispLocation,
    TxnLotNumber,
    -- NOT USED
    TxnExpirationDate,
    -- NOT USED
    SYSStartTime,
    SYSEndTime,
FROM
    FHA_ANALYTICS.FHA.F_MeditechPHARxTransactions