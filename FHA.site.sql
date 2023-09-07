SELECT
    TOP (1000) SYSSystemID as system_id,
    Mnemonic as site_id,
    Active as active,
    Name as site_name
FROM
    FHA_ANALYTICS.FHA.D_MeditechMISFacilityMain