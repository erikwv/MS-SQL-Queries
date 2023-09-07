/****** Script for SelectTopNRows command from SSMS  ******/
SELECT
    TOP (1000) SYSSystemID
    /* 
     For most solid-dose drugs: 
     - Strength = StrengthAmt1 + OrderUnit (e.g. 20 MG = 20 MG)
     - StrengthAmt1 = StrengthAmt2 = DispenseSize (e.g. 20 MG = 20)
     - OrderUnit = DispenseUnit (e.g. 20 MG = MG)
     For injectable, liquid or packaged drug products:
     - Strength = StrengthAmt1/StrengthAmt2 + DispenseUnit (e.g. 100 MG/10 ML)
     - StrengthAmt1 = mass of m/v stock product (50 MG = 50)
     - StrengthAmt2 = volume of m/v stock product (10 ML = 10)
     - DispenseDose = volume of dose (1 ML dispensed/given of 100 MG/10 ML = 1 ML)
     - DispenseUnit = volume unit (e.g. ML)
     - DispenseForm = bulk product form (e.g. BAG, VIAL, PKG) where applicable
     - AdminForm = admin form type (e.g. BAG = INJ, VIAL = INJ, PKG = TAB)
     */
    Active,
    Name,
    Generic,
    Strength,
    StrengthAmt1,
    OrderUnit,
    StrengthAmt2,
    DispenseUnit,
    DispenseForm,
    AdminForm,
    OrderSize,
    DispenseSize,
    NdcDinNumber,
    SYSStartTime,
    SYSEndTime
FROM
    FHA_ANALYTICS.FHA.D_MeditechPHADrugMain