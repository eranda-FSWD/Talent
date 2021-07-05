IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210705020113_TalentMigration')
BEGIN
    CREATE TABLE [Customer] (
        [Id] int NOT NULL IDENTITY,
        [Name] varchar(255) NOT NULL,
        [Address] varchar(255) NULL,
        CONSTRAINT [PK_Customer] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210705020113_TalentMigration')
BEGIN
    CREATE TABLE [Product] (
        [Id] int NOT NULL IDENTITY,
        [Name] varchar(255) NOT NULL,
        [Price] decimal(10, 2) NOT NULL,
        CONSTRAINT [PK_Product] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210705020113_TalentMigration')
BEGIN
    CREATE TABLE [Store] (
        [Id] int NOT NULL IDENTITY,
        [Name] varchar(255) NOT NULL,
        [Address] varchar(255) NULL,
        CONSTRAINT [PK_Store] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210705020113_TalentMigration')
BEGIN
    CREATE TABLE [Sales] (
        [Id] int NOT NULL IDENTITY,
        [ProductId] int NULL,
        [CustomerId] int NULL,
        [StoreId] int NULL,
        [DateSold] date NULL,
        CONSTRAINT [PK_Sales] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Sales_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [Customer] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Sales_Product] FOREIGN KEY ([ProductId]) REFERENCES [Product] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Sales_Store] FOREIGN KEY ([StoreId]) REFERENCES [Store] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210705020113_TalentMigration')
BEGIN
    CREATE INDEX [IX_Sales_CustomerId] ON [Sales] ([CustomerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210705020113_TalentMigration')
BEGIN
    CREATE INDEX [IX_Sales_ProductId] ON [Sales] ([ProductId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210705020113_TalentMigration')
BEGIN
    CREATE INDEX [IX_Sales_StoreId] ON [Sales] ([StoreId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210705020113_TalentMigration')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210705020113_TalentMigration', N'3.1.15');
END;

GO

