/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) SYSSystemID
      Mnemonic,
      Active,
      Name,
      Pager,
      Phone,
      DrType,
      Service,
      Number,
      AdmitPriv,
      LicenseNumber,
      AbsSpecService,
      DrGroup,
      DeaNumber,
      CkAdmitPriv,
      FaxNumber,
      LabClient,
      LabListFacMatch,
      OnStaff,
      TempDrGroup,
      DirectAddress,
      Module,
      Association
  FROM FHA_ANALYTICS.FHA.D_MeditechMISDocMain
  WHERE SYSSystemID = 'MC'