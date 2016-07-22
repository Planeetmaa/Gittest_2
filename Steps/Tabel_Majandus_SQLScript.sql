-- Delete Relatsioon --
If Object_Id('FK_LOG_Majandus')  Is Not Null Begin ALTER TABLE [Log].[Majandus_Log] Drop CONSTRAINT [FK_LOG_Majandus]  End
If Object_Id('FK_User_Majandus') Is Not Null Begin ALTER TABLE [Dbo].[Majandus_Tab] Drop CONSTRAINT [FK_User_Majandus] End
Go

-- Delete Tables --
IF Object_Id('Log.Majandus_Log')        Is Not Null Begin Drop Table Log.Majandus_Log End
IF Object_Id('dbo.Majandus_Tab')        Is Not Null Begin Drop Table dbo.Majandus_Tab End
Go

-- Object / Data --
CREATE TABLE dbo.Majandus_Tab
(
    [ID_Majandus]    [decimal](18, 0) IDENTITY(1,1) NOT NULL,
    [Majand_ID]    [uniqueidentifier] NOT NULL,
    [In_Date]       [datetime] NOT NULL,
    [Open_Date]     [datetime] NOT NULL,
    [Is_Close]      [Bit] NOT NULL,
    [Clos_Date]     [datetime] NULL,
    [SYSUserName]   [nVarChar](125) Not NULL,
    [ID_User]       [decimal](18, 0) Not NULL,
 
    [Name]                   [nVarChar](125)   Not NULL,
    [Code]                   [nVarChar](25)   NULL,
    [Company_Code]           [Decimal](8,0)   NULL,
    [Unit_Code]              [Decimal](8,0)   NULL,
    [Department_Code]        [Decimal](8,0)   NULL,
    [Grupp_Code]             [Decimal](8,0)   NULL,
    [Per_Start]              [DateTime] NULL,
    [Job_Title_Code]         [Decimal](8,0)   NULL,
    [Manager_Name]           [nVarChar](125)   NULL,
    [On_tark]                [bit] NOT null,
    [Replaceable]            [nVarChar](125)   NULL,
    [Street]                 [nVarChar](125)   NULL,
    [City]                   [nVarChar](125)   NULL,
    [Mobla]                  [nVarChar](25)   NULL,
    [Email]                  [nVarChar](52)   NULL,
    [Phone]                  [nVarChar](25)   NULL,
    [PR_Leave]               [Bit] Not NULL
 
 CONSTRAINT PK_Majandus_Tab PRIMARY KEY CLUSTERED
(
    [ID_Majandus] Asc
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE dbo.Majandus_Tab ADD  CONSTRAINT [DF_Majandus_Majand_ID]  DEFAULT (newid()) FOR [Majand_ID]
GO
ALTER TABLE dbo.Majandus_Tab ADD  CONSTRAINT [DF_Majandus_In_Date]  DEFAULT (getdate()) FOR [In_Date]
GO
ALTER TABLE dbo.Majandus_Tab ADD  CONSTRAINT [DF_Majandus_Open_Date]  DEFAULT (getdate()) FOR [Open_Date]
GO
ALTER TABLE dbo.Majandus_Tab ADD  CONSTRAINT [DF_Majandus_Is_Close]  DEFAULT ((0)) FOR [Is_Close]
GO
ALTER TABLE dbo.Majandus_Tab ADD  CONSTRAINT [DF_Majandus_SYSUserName]  DEFAULT (suser_sname()) FOR [SYSUserName]
GO
ALTER TABLE dbo.Majandus_Tab ADD  CONSTRAINT [DF_Majandus_On_tark]  DEFAULT ((0)) FOR [On_tark]
GO
ALTER TABLE dbo.Majandus_Tab ADD  CONSTRAINT [DF_Majandus_PR_Leave]  DEFAULT ((0)) FOR [PR_Leave]
GO

-- Master Field Description --
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Võtme väli', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN',@level2name=N'ID_Majandus'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Tabeli ID', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN',@level2name=N'Majand_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Kirje loomise kuupäev',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN',@level2name=N'In_Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Kirje muutmise kuupäev',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN',@level2name=N'Open_Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Kirje on kustutatud',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN',@level2name=N'Is_Close'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Kirje kustutamise kuupäev',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN',@level2name=N'Clos_Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'SQL Kasutaja nimi kes lõi kirje',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN',@level2name=N'SYSUserName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'SQL Kasutaja id',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN',@level2name=N'ID_User'

-- Field Description --
EXEC sys.sp_addextendedproperty @level2name=N'Company_Code', @value=N'czxc',@name=N'MS_Description',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN'
EXEC sys.sp_addextendedproperty @level2name=N'Department_Code', @value=N'sfaf',@name=N'MS_Description',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN'
EXEC sys.sp_addextendedproperty @level2name=N'Grupp_Code', @value=N'Gruppi koodi nimetus',@name=N'MS_Description',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN'
EXEC sys.sp_addextendedproperty @level2name=N'Manager_Name', @value=N'Juhi nimi',@name=N'MS_Description',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab', @level2type=N'COLUMN'


-- Table Description --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabeli info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Majandus_Tab'
GO

-- Index --
CREATE NONCLUSTERED INDEX [IX_Majandus_Tab_Majand_ID] ON [dbo].[Majandus_Tab] ([Majand_ID] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Majandus_Tab_Name] ON [dbo].[Majandus_Tab] ([Name] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Majandus_Tab_Code] ON [dbo].[Majandus_Tab] ([Code] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Majandus_Tab_Grupp_Code] ON [dbo].[Majandus_Tab] ([Grupp_Code] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
GO

-- Object / Log --
CREATE TABLE Log.Majandus_Log
(
    [Data_ID]       [decimal](18, 0) IDENTITY(1,1) NOT NULL,
    [Data_In_Date]  [datetime] NOT NULL,
    
    [ID_Majandus]    [decimal](18, 0) NOT NULL,
    [Majand_ID]    [uniqueidentifier] NOT NULL,
    [In_Date]       [datetime] NOT NULL,
    [Open_Date]     [datetime] NOT NULL,
    [Is_Close]      [Bit] NOT NULL,
    [Clos_Date]     [datetime] NULL,
    [SYSUserName]   [nVarChar](125) Not NULL,
    [ID_User]       [decimal](18, 0) Not NULL,
    
    [Name]                   [nVarChar](125)   Not NULL,
    [Code]                   [nVarChar](25)   NULL,
    [Company_Code]           [Decimal](8,0)   NULL,
    [Unit_Code]              [Decimal](8,0)   NULL,
    [Department_Code]        [Decimal](8,0)   NULL,
    [Grupp_Code]             [Decimal](8,0)   NULL,
    [Per_Start]              [DateTime] NULL,
    [Job_Title_Code]         [Decimal](8,0)   NULL,
    [Manager_Name]           [nVarChar](125)   NULL,
    [On_tark]                [bit] NOT null,
    [Replaceable]            [nVarChar](125)   NULL,
    [Street]                 [nVarChar](125)   NULL,
    [City]                   [nVarChar](125)   NULL,
    [Mobla]                  [nVarChar](25)   NULL,
    [Email]                  [nVarChar](52)   NULL,
    [Phone]                  [nVarChar](25)   NULL,
    [PR_Leave]               [Bit] Not NULL
    
 CONSTRAINT PK_LOG_Majandus_Log PRIMARY KEY CLUSTERED
(
    [Data_ID] Asc
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE Log.Majandus_Log ADD  CONSTRAINT [DF_LOG_Majandus_In_Date]  DEFAULT (getdate()) FOR [Data_In_Date]
GO

-- Log Index --
CREATE NONCLUSTERED INDEX [IX_Majandus_Log_ID_Majandus] ON [Log].[Majandus_Log] ([ID_Majandus] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- Update Triger --
Create Trigger dbo.Majandus_Update On dbo.Majandus_Tab For Update as
If Not Update(Open_date)
Begin
Insert into Log.Majandus_Log
    (
        [ID_Majandus],
        [Majand_ID],
        [In_Date],
        [Open_Date],
        [Is_Close],
        [Clos_Date],
        [SYSUserName],
        [ID_User],
    
        [Name],
        [Code],
        [Company_Code],
        [Unit_Code],
        [Department_Code],
        [Grupp_Code],
        [Per_Start],
        [Job_Title_Code],
        [Manager_Name],
        [On_tark],
        [Replaceable],
        [Street],
        [City],
        [Mobla],
        [Email],
        [Phone],
        [PR_Leave]
      )
Select
        [ID_Majandus],
        [Majand_ID],
        [In_Date],
        [Open_Date],
        [Is_Close],
        [Clos_Date],
        [SYSUserName],
        [ID_User],
    
        [Name],
        [Code],
        [Company_Code],
        [Unit_Code],
        [Department_Code],
        [Grupp_Code],
        [Per_Start],
        [Job_Title_Code],
        [Manager_Name],
        [On_tark],
        [Replaceable],
        [Street],
        [City],
        [Mobla],
        [Email],
        [Phone],
        [PR_Leave]
From deleted
Update TT Set TT.Open_date = Getdate(),TT.SYSUserName = suser_sname() From Inserted I Inner Join dbo.Majandus_Tab TT On I.ID_Majandus = TT.ID_Majandus
End
Go

-- Delete Triger --
Create Trigger dbo.TR_Delete_Majandus On dbo.Majandus_Tab INSTEAD OF DELETE As
Update Dbo.Majandus_Tab
Set
    [Is_Close] = 1
   ,[Clos_Date] = Getdate()
From Majandus_Tab join Deleted On Majandus_Tab.[ID_Majandus] = Deleted.[ID_Majandus];
Go

/*********************************************************************************
View 'd
**********************************************************************************/

IF Object_Id('Data.Majandus') Is Not Null Begin Drop View Data.Majandus End
GO

Create View Data.Majandus as
Select
        [ID_Majandus],
        [Majand_ID],

        [Name],
        [Code],
        [Company_Code],
        [Unit_Code],
        [Department_Code],
        [Grupp_Code],
        [Per_Start],
        [Job_Title_Code],
        [Manager_Name],
        [On_tark],
        [Replaceable],
        [Street],
        [City],
        [Mobla],
        [Email],
        [Phone],
        [PR_Leave],

        [In_Date],
        [Open_Date],
        [SYSUserName],
        [ID_User]
        
From dbo.Majandus_Tab
Where [Is_Close] = 0
Go

-- Relatsioon To LOG --
ALTER TABLE [Log].[Majandus_Log] WITH CHECK ADD  CONSTRAINT [FK_LOG_Majandus] FOREIGN KEY([ID_Majandus]) REFERENCES [dbo].[Majandus_Tab] ([ID_Majandus])
ALTER TABLE [Log].[Majandus_Log] CHECK CONSTRAINT [FK_LOG_Majandus]

GO

-- Relatsioon To USER --
ALTER TABLE [Dbo].[Majandus_Tab] WITH CHECK ADD  CONSTRAINT [FK_User_Majandus] FOREIGN KEY([ID_User]) REFERENCES [dbo].[Users_Tab] ([ID_User])
ALTER TABLE [Dbo].[Majandus_Tab] CHECK CONSTRAINT [FK_User_Majandus]

GO

