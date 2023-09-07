SELECT
    F_MeditechADMPatMain.SYSSystemID AS system_id,
    F_MeditechADMPatMain.UnitNumber AS patient_id,
    AcctNumber AS encounter_num,
    Name AS name_full,
    Status AS status,
    FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall.HealthCareNumber AS phn,
    Birthdate AS dob,
    Sex,
    D_MeditechMISRoomMain.Location AS nurse_unit,
    AdmitDate AS admit_date,
    AdmitTime AS admit_time,
    AdmitDateTime AS admit_datetime,
    D_MeditechMISRoomMain.Service,
    ServiceDate AS service_date,
    ServiceTime AS service_time,
    ServiceDateTime AS service_datetime,
    DischargeDate AS discharge_date,
    DischargeTime AS discharge_time,
    DischargeDateTime AS discharge_datetime
FROM
    FHA_ANALYTICS.FHA.F_MeditechADMPatMain
    INNER JOIN FHA_ANALYTICS.FHA.F_MeditechADMPatCanadaRecall ON F_MeditechADMPatCanadaRecall.Urn = F_MeditechADMPatMain.Urn
    INNER JOIN FHA_ANALYTICS.FHA.D_MeditechMISRoomMain on D_MeditechMISRoomMain.Location = F_MeditechADMPatMain.Location
WHERE
    ServiceDate > 20170101