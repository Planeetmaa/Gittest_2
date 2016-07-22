-- Delete Relatsioon --
If Object_Id('FK_LOG_Xml_Service')  Is Not Null Begin ALTER TABLE [Log].[Xml_Service_Log] Drop CONSTRAINT [FK_LOG_Xml_Service]  End
If Object_Id('FK_User_Xml_Service') Is Not Null Begin ALTER TABLE [Dbo].[Xml_Service_Tab] Drop CONSTRAINT [FK_User_Xml_Service] End
Go

-- Delete Tables --
IF Object_Id('Log.Xml_Service_Log')        Is Not Null Begin Drop Table Log.Xml_Service_Log End
IF Object_Id('dbo.Xml_Service_Tab')        Is Not Null Begin Drop Table dbo.Xml_Service_Tab End
Go

-- Object / Data --
CREATE TABLE dbo.Xml_Service_Tab
(
    [ID_XML]    [decimal](18, 0) IDENTITY(1,1) NOT NULL,
    [XML_ID]    [uniqueidentifier] NOT NULL,
    [In_Date]       [datetime] NOT NULL,
    [Open_Date]     [datetime] NOT NULL,
    [Is_Close]      [Bit] NOT NULL,
    [Clos_Date]     [datetime] NULL,
    [SYSUserName]   [nVarChar](125) Not NULL,
    [ID_User]       [decimal](18, 0) Not NULL,
 
    [Kood]                   [nVarChar](125)   NULL,
    [Xml_Data]               [xml] NULL,
    [IS_Hand]                [Bit] not null,
    [Hand_Date]              [Datetime] NULL
 
 CONSTRAINT PK_Xml_Service_Tab PRIMARY KEY CLUSTERED
(
    [ID_XML] Asc
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE dbo.Xml_Service_Tab ADD  CONSTRAINT [DF_Xml_Service_XML_ID]  DEFAULT (newid()) FOR [XML_ID]
GO
ALTER TABLE dbo.Xml_Service_Tab ADD  CONSTRAINT [DF_Xml_Service_In_Date]  DEFAULT (getdate()) FOR [In_Date]
GO
ALTER TABLE dbo.Xml_Service_Tab ADD  CONSTRAINT [DF_Xml_Service_Open_Date]  DEFAULT (getdate()) FOR [Open_Date]
GO
ALTER TABLE dbo.Xml_Service_Tab ADD  CONSTRAINT [DF_Xml_Service_Is_Close]  DEFAULT ((0)) FOR [Is_Close]
GO
ALTER TABLE dbo.Xml_Service_Tab ADD  CONSTRAINT [DF_Xml_Service_SYSUserName]  DEFAULT (suser_sname()) FOR [SYSUserName]
GO
ALTER TABLE dbo.Xml_Service_Tab ADD  CONSTRAINT [DF_Xml_Service_IS_Hand]  DEFAULT ((0)) FOR [IS_Hand]
GO

-- Master Field Description --
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Võtme väli', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab', @level2type=N'COLUMN',@level2name=N'ID_XML'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Tabeli ID', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab', @level2type=N'COLUMN',@level2name=N'XML_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Kirje loomise kuupäev',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab', @level2type=N'COLUMN',@level2name=N'In_Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Kirje muutmise kuupäev',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab', @level2type=N'COLUMN',@level2name=N'Open_Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Kirje on kustutatud',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab', @level2type=N'COLUMN',@level2name=N'Is_Close'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Kirje kustutamise kuupäev',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab', @level2type=N'COLUMN',@level2name=N'Clos_Date'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'SQL Kasutaja nimi kes lõi kirje',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab', @level2type=N'COLUMN',@level2name=N'SYSUserName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'SQL Kasutaja id',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab', @level2type=N'COLUMN',@level2name=N'ID_User'

-- Field Description --


-- Table Description --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Andme edastuse info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Xml_Service_Tab'
GO

-- Index --
CREATE NONCLUSTERED INDEX [IX_Xml_Service_Tab_XML_ID] ON [dbo].[Xml_Service_Tab] ([XML_ID] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
GO

-- Object / Log --
CREATE TABLE Log.Xml_Service_Log
(
    [Data_ID]       [decimal](18, 0) IDENTITY(1,1) NOT NULL,
    [Data_In_Date]  [datetime] NOT NULL,
    
    [ID_XML]    [decimal](18, 0) NOT NULL,
    [XML_ID]    [uniqueidentifier] NOT NULL,
    [In_Date]       [datetime] NOT NULL,
    [Open_Date]     [datetime] NOT NULL,
    [Is_Close]      [Bit] NOT NULL,
    [Clos_Date]     [datetime] NULL,
    [SYSUserName]   [nVarChar](125) Not NULL,
    [ID_User]       [decimal](18, 0) Not NULL,
    
    [Kood]                   [nVarChar](125)   NULL,
    [Xml_Data]               [xml] NULL,
    [IS_Hand]                [Bit] not null,
    [Hand_Date]              [Datetime] NULL
    
 CONSTRAINT PK_LOG_Xml_Service_Log PRIMARY KEY CLUSTERED
(
    [Data_ID] Asc
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE Log.Xml_Service_Log ADD  CONSTRAINT [DF_LOG_Xml_Service_In_Date]  DEFAULT (getdate()) FOR [Data_In_Date]
GO

-- Log Index --
CREATE NONCLUSTERED INDEX [IX_Xml_Service_Log_ID_XML] ON [Log].[Xml_Service_Log] ([ID_XML] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- Update Triger --
Create Trigger dbo.Xml_Service_Update On dbo.Xml_Service_Tab For Update as
If Not Update(Open_date)
Begin
Insert into Log.Xml_Service_Log
    (
        [ID_XML],
        [XML_ID],
        [In_Date],
        [Open_Date],
        [Is_Close],
        [Clos_Date],
        [SYSUserName],
        [ID_User],
    
        [Kood],
        [Xml_Data],
        [IS_Hand],
        [Hand_Date]
      )
Select
        [ID_XML],
        [XML_ID],
        [In_Date],
        [Open_Date],
        [Is_Close],
        [Clos_Date],
        [SYSUserName],
        [ID_User],
    
        [Kood],
        [Xml_Data],
        [IS_Hand],
        [Hand_Date]
From deleted
Update TT Set TT.Open_date = Getdate(),TT.SYSUserName = suser_sname() From Inserted I Inner Join dbo.Xml_Service_Tab TT On I.ID_XML = TT.ID_XML
End
Go

-- Delete Triger --
Create Trigger dbo.TR_Delete_Xml_Service On dbo.Xml_Service_Tab INSTEAD OF DELETE As
Update Dbo.Xml_Service_Tab
Set
    [Is_Close] = 1
   ,[Clos_Date] = Getdate()
From Xml_Service_Tab join Deleted On Xml_Service_Tab.[ID_XML] = Deleted.[ID_XML];
Go

/*********************************************************************************
View 'd
**********************************************************************************/

IF Object_Id('Data.Xml_Service') Is Not Null Begin Drop View Data.Xml_Service End
GO

Create View Data.Xml_Service as
Select
        [ID_XML],
        [XML_ID],

        [Kood],
        [Xml_Data],
        [IS_Hand],
        [Hand_Date],

        [In_Date],
        [Open_Date],
        [SYSUserName],
        [ID_User]
        
From dbo.Xml_Service_Tab
Where [Is_Close] = 0
Go

-- Relatsioon To LOG --
ALTER TABLE [Log].[Xml_Service_Log] WITH CHECK ADD  CONSTRAINT [FK_LOG_Xml_Service] FOREIGN KEY([ID_XML]) REFERENCES [dbo].[Xml_Service_Tab] ([ID_XML])
ALTER TABLE [Log].[Xml_Service_Log] CHECK CONSTRAINT [FK_LOG_Xml_Service]

GO

-- Relatsioon To USER --
ALTER TABLE [Dbo].[Xml_Service_Tab] WITH CHECK ADD  CONSTRAINT [FK_User_Xml_Service] FOREIGN KEY([ID_User]) REFERENCES [dbo].[Users_Tab] ([ID_User])
ALTER TABLE [Dbo].[Xml_Service_Tab] CHECK CONSTRAINT [FK_User_Xml_Service]

GO

