-- Delete Relatsioon --
If Object_Id('FK_LOG_Bank')  Is Not Null Begin ALTER TABLE [Log].[Bank_Log] Drop CONSTRAINT [FK_LOG_Bank]  End
If Object_Id('FK_User_Bank') Is Not Null Begin ALTER TABLE [Dbo].[Bank] Drop CONSTRAINT [FK_User_Bank] End
Go

-- Delete Tables --
IF Object_Id('Log.Bank_Log')        Is Not Null Begin Drop Table Log.Bank_Log End
IF Object_Id('dbo.Bank')        Is Not Null Begin Drop Table dbo.Bank End
Go

-- Object / Data --
CREATE TABLE dbo.Bank
(
    [ID_Bank]    [decimal](18, 0) IDENTITY(1,1) NOT NULL,
 
    [Kood]                   [nVarChar](125)   NULL,
    [Nimeus]                 [nVarChar](25)   NULL,
    [Email]                  [nVarChar](52)   NULL,
    [Phone]                  [nVarChar](25)   NULL,
    [Suletud]                [Bit] Not NULL
 
 CONSTRAINT PK_Bank PRIMARY KEY CLUSTERED
(
    [ID_Bank] Asc
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


GO
ALTER TABLE dbo.Bank ADD  CONSTRAINT [DF_Bank_Suletud]  DEFAULT ((0)) FOR [Suletud]
GO

-- Master Field Description --
EXEC sys.sp_addextendedproperty @name=N'MS_Description',@value=N'Võtme väli', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bank', @level2type=N'COLUMN',@level2name=N'ID_Bank'
-- Field Description --
EXEC sys.sp_addextendedproperty @level2name=N'Phone', @value=N'on vajalik',@name=N'MS_Description',@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bank', @level2type=N'COLUMN'


-- Table Description --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabeli info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bank'
GO

-- Index --
GO
CREATE NONCLUSTERED INDEX [IX_Bank_Kood] ON [dbo].[Bank] ([Kood] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Bank_Phone] ON [dbo].[Bank] ([Phone] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
GO

