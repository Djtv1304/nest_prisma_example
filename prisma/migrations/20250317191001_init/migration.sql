BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[User] (
    [id] INT NOT NULL IDENTITY(1,1),
    [username] VARCHAR(50) NOT NULL,
    [firstName] VARCHAR(50) NOT NULL,
    [lastName] VARCHAR(50) NOT NULL,
    [password] VARCHAR(255) NOT NULL,
    CONSTRAINT [User_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [User_username_key] UNIQUE NONCLUSTERED ([username])
);

-- CreateTable
CREATE TABLE [dbo].[Passenger] (
    [id] INT NOT NULL IDENTITY(1,1),
    [identify] VARCHAR(20) NOT NULL,
    [typeDocument] VARCHAR(10) NOT NULL,
    [birthday] DATETIME2 NOT NULL,
    [userId] INT,
    CONSTRAINT [Passenger_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Passenger_userId_key] UNIQUE NONCLUSTERED ([userId])
);

-- CreateTable
CREATE TABLE [dbo].[Activity] (
    [id] INT NOT NULL IDENTITY(1,1),
    [description] VARCHAR(255) NOT NULL,
    [passengerId] INT NOT NULL,
    CONSTRAINT [Activity_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Form] (
    [id] INT NOT NULL IDENTITY(1,1),
    [respuesta] VARCHAR(500) NOT NULL,
    [passengerId] INT NOT NULL,
    CONSTRAINT [Form_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Form_passengerId_key] UNIQUE NONCLUSTERED ([passengerId])
);

-- AddForeignKey
ALTER TABLE [dbo].[Passenger] ADD CONSTRAINT [Passenger_userId_fkey] FOREIGN KEY ([userId]) REFERENCES [dbo].[User]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Activity] ADD CONSTRAINT [Activity_passengerId_fkey] FOREIGN KEY ([passengerId]) REFERENCES [dbo].[Passenger]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Form] ADD CONSTRAINT [Form_passengerId_fkey] FOREIGN KEY ([passengerId]) REFERENCES [dbo].[Passenger]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
