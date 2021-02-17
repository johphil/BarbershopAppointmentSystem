USE [BARBERSHOP_DBF]
GO
/****** Object:  Table [dbo].[Account]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[registration] [datetime] NOT NULL,
	[lastlogin] [datetime] NULL,
	[lastpasswordreset] [datetime] NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountDetails]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDetails](
	[accountid] [int] NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[gender] [char](1) NULL,
	[birthday] [date] NULL,
	[address] [varchar](max) NULL,
	[contactno] [varchar](20) NULL,
	[introduction] [varchar](200) NULL,
 CONSTRAINT [PK_accountdetails] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[DateClicked] [datetime] NOT NULL,
	[IsDone] [bit] NOT NULL,
	[IsCancelled] [bit] NOT NULL,
	[DateUpdated] [datetime] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Barber]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barber](
	[BarberID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Barber] PRIMARY KEY CLUSTERED 
(
	[BarberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[BarberID] [int] NOT NULL,
	[ScheduleDate] [date] NOT NULL,
	[TimeSlotID] [int] NOT NULL,
	[IsBooked] [bit] NOT NULL,
	[IsDone] [bit] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[TimeSlotID] [int] IDENTITY(1,1) NOT NULL,
	[TimeString] [varchar](20) NOT NULL,
	[Time] [time](7) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[TimeSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([accountid], [username], [password], [registration], [lastlogin], [lastpasswordreset], [admin]) VALUES (1, N'johphil', N'LuaDokNwojD52E59Zh+N/Q==', CAST(N'2021-02-17T15:17:53.837' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[AccountDetails] ([accountid], [firstname], [lastname], [email], [gender], [birthday], [address], [contactno], [introduction]) VALUES (1, N'John Philip', N'Encarnacion', N'johphilencarnacion@gmail.com', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (1, N'8:00 AM', CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (2, N'9:00 AM', CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (3, N'10:00 AM', CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (4, N'11:00 AM', CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (5, N'2:00 PM', CAST(N'14:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (6, N'3:00 PM', CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (7, N'4:00 PM', CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (8, N'5:00 PM', CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (9, N'6:00 PM', CAST(N'18:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (10, N'7:00 PM', CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[TimeSlot] ([TimeSlotID], [TimeString], [Time]) VALUES (11, N'8:00 PM', CAST(N'20:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_admin]  DEFAULT ((0)) FOR [admin]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_IsDone]  DEFAULT ((0)) FOR [IsDone]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_IsCancelled]  DEFAULT ((0)) FOR [IsCancelled]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_IsDone]  DEFAULT ((0)) FOR [IsBooked]
GO
ALTER TABLE [dbo].[Schedule] ADD  CONSTRAINT [DF_Schedule_IsDone_1]  DEFAULT ((0)) FOR [IsDone]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[AccountDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_accountdetails_Account] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([accountid])
GO
ALTER TABLE [dbo].[AccountDetails] CHECK CONSTRAINT [FK_accountdetails_Account]
GO
ALTER TABLE [dbo].[Appointment]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointment_AccountDetails] FOREIGN KEY([AccountID])
REFERENCES [dbo].[AccountDetails] ([accountid])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_AccountDetails]
GO
ALTER TABLE [dbo].[Appointment]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointment_Schedule] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Schedule]
GO
ALTER TABLE [dbo].[Schedule]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedule_Barber] FOREIGN KEY([BarberID])
REFERENCES [dbo].[Barber] ([BarberID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Barber]
GO
ALTER TABLE [dbo].[Schedule]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedule_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Service]
GO
ALTER TABLE [dbo].[Schedule]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedule_TimeSlot] FOREIGN KEY([TimeSlotID])
REFERENCES [dbo].[TimeSlot] ([TimeSlotID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_TimeSlot]
GO
/****** Object:  StoredProcedure [dbo].[spAddAppointment]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddAppointment]
@accountid int,
@serviceid int,
@barberid int,
@scheduledate date,
@timeslotid int

AS
BEGIN
	DECLARE @scheduleid int = null
	SET @scheduleid = (SELECT ScheduleID
						FROM Schedule
						WHERE ServiceID = @serviceid AND BarberID = @barberid AND ScheduleDate = @scheduledate AND TimeSlotID = @timeslotid)
	
	IF EXISTS (SELECT *
				FROM Appointment
				WHERE AccountID = @accountid AND ScheduleID = @scheduleid AND IsCancelled = 0)
	BEGIN
		SELECT CAST(-69 as int)
	END
	ELSE
	BEGIN
		IF @scheduleid IS NOT NULL
		BEGIN
			INSERT INTO Appointment(ScheduleID, AccountID, DateClicked, IsDone)
							VALUES(@scheduleid, @accountid, GETDATE(), 0)
			UPDATE Schedule
			SET IsBooked = 1
			WHERE ScheduleID = @scheduleid

			SELECT CAST(1 as int)
		END
		ELSE
		BEGIN
			SELECT CAST(-1 as int)
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spAddBarber]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddBarber]
@name varchar(50)

AS
BEGIN
	INSERT INTO Barber(Name)
				VALUES(@name)
END
GO
/****** Object:  StoredProcedure [dbo].[spAddSchedule]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddSchedule]
@serviceid int,
@barberid int,
@scheduledate date,
@timeslotid int

AS
BEGIN
	IF EXISTS (SELECT * 
				FROM Schedule 
				WHERE ServiceID = @serviceid AND 
				BarberID = @barberid AND 
				ScheduleDate = @scheduledate AND 
				TimeSlotID = @timeslotid)
	BEGIN
		SELECT CAST(-69 as int)
	END
	ELSE
	BEGIN
		INSERT INTO Schedule(ServiceID, BarberID, ScheduleDate, TimeSlotID)
						VALUES(@serviceid, @barberid, @scheduledate, @timeslotid)

		SELECT CAST(1 as int)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spAddService]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddService]
@name varchar(100),
@price money

AS
BEGIN
	INSERT INTO Service(Name, Price)
				VALUES(@name, @price)
END
GO
/****** Object:  StoredProcedure [dbo].[spCancelAppointment]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCancelAppointment]
@appointmentid int

AS
BEGIN
	DECLARE @scheduleid int
	SET @scheduleid = (SELECT ScheduleID FROM Appointment WHERE AppointmentID = @appointmentid)

	BEGIN TRAN
	
	UPDATE Appointment
	SET IsCancelled = 1,
		DateUpdated = GETDATE()
	WHERE AppointmentID = @appointmentid

	UPDATE Schedule
	SET IsBooked = 0
	WHERE ScheduleID = @scheduleid

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		SELECT CAST(-69 as int)
	END
	ELSE
	BEGIN
		COMMIT
		SELECT CAST(1 as int)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteBarber]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteBarber]
@barberid int

AS
BEGIN
	DELETE
	FROM Barber
	WHERE BarberID = @barberid
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteSchedule]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteSchedule]
@scheduleid int

AS
BEGIN
	DELETE
	FROM Schedule
	WHERE ScheduleID = @scheduleid
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteService]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteService]
@serviceid int

AS
BEGIN
	DELETE 
	FROM Service
	WHERE ServiceID = @serviceid
END
GO
/****** Object:  StoredProcedure [dbo].[spFinishAppointment]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spFinishAppointment]
@appointmentid int

AS
BEGIN
	DECLARE @scheduleid int
	SET @scheduleid = (SELECT ScheduleID FROM Appointment WHERE AppointmentID = @appointmentid)

	BEGIN TRAN
	
	UPDATE Appointment
	SET IsDone = 1,
		DateUpdated = GETDATE()
	WHERE AppointmentID = @appointmentid

	UPDATE Schedule
	SET IsDone = 1
	WHERE ScheduleID = @scheduleid

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		SELECT CAST(-69 as int)
	END
	ELSE
	BEGIN
		COMMIT
		SELECT CAST(1 as int)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAccountDetails]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAccountDetails]
@accountid int

AS
BEGIN
	SELECT A.accountid, A.username, A.admin, A.registration, A.lastlogin, A.lastpasswordreset, b.firstname, b.lastname, b.email, b.gender, b.birthday, b.address, b.contactno, b.introduction
	FROM Account A
	INNER JOIN AccountDetails B
	ON A.accountid = B.accountid
	WHERE A.accountid = @accountid
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllServices]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllServices]

AS
BEGIN
	SELECT A.ServiceID, A.Name, A.Price, B.Bookings
	FROM Service A
	LEFT JOIN (SELECT BB.ServiceID, COUNT(*) AS Bookings
				FROM Appointment AA
				INNER JOIN Schedule BB
				ON AA.ScheduleID = BB.ScheduleID
				WHERE AA.IsDone = 1
				GROUP BY BB.ServiceID) B
	ON A.ServiceID = B.ServiceID
	ORDER BY A.Name, A.Price ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAppointments]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAppointments]
@accountid int = null

AS
BEGIN
	IF @accountid IS NOT NULL
	BEGIN
		SELECT A.AppointmentID, B.ScheduleID, C.ServiceID, C.Name, C.Price, D.BarberID, D.Name, B.ScheduleDate, E.TimeSlotID, E.TimeString, E.Time, A.DateClicked, A.IsDone, A.IsCancelled
		FROM Appointment A
		INNER JOIN Schedule B
		ON A.ScheduleID = B.ScheduleID
		INNER JOIN [Service] C
		ON B.ServiceID = C.ServiceID
		INNER JOIN Barber D
		ON B.BarberID = D.BarberID
		INNER JOIN TimeSlot E
		ON B.TimeSlotID = E.TimeSlotID
		WHERE A.AccountID = @accountid
		ORDER BY A.DateClicked DESC
	END
	ELSE
	BEGIN
		SELECT A.AppointmentID, F.accountid, F.username, B.ScheduleID, C.ServiceID, C.Name, C.Price, D.BarberID, D.Name, B.ScheduleDate, E.TimeSlotID, E.TimeString, E.Time, A.DateClicked, A.IsDone, A.IsCancelled
		FROM Appointment A
		INNER JOIN Schedule B
		ON A.ScheduleID = B.ScheduleID
		INNER JOIN [Service] C
		ON B.ServiceID = C.ServiceID
		INNER JOIN Barber D
		ON B.BarberID = D.BarberID
		INNER JOIN TimeSlot E
		ON B.TimeSlotID = E.TimeSlotID
		INNER JOIN Account F
		ON A.AccountID = F.accountid
		WHERE A.IsDone = 0 AND A.IsCancelled = 0
		ORDER BY A.DateClicked DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGetBarbers]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetBarbers]

AS
BEGIN
	SELECT BarberID, Name
	FROM Barber
	ORDER BY BarberID ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetPopularServices]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetPopularServices]

AS
BEGIN
	SELECT TOP 3 A.ServiceID, A.Name, A.Price, B.Bookings
	FROM Service A
	INNER JOIN (SELECT BB.ServiceID, COUNT(*) AS Bookings
				FROM Appointment AA
				INNER JOIN Schedule BB
				ON AA.ScheduleID = BB.ScheduleID
				WHERE AA.IsDone = 1
				GROUP BY BB.ServiceID) B
	ON A.ServiceID = B.ServiceID
	ORDER BY B.Bookings DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetRecentAppointments]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetRecentAppointments]

AS
BEGIN
	SELECT A.AppointmentID, F.accountid, F.username, B.ScheduleID, C.ServiceID, C.Name, C.Price, D.BarberID, D.Name, B.ScheduleDate, E.TimeSlotID, E.TimeString, E.Time, A.DateClicked, A.IsDone, A.IsCancelled, A.DateUpdated
	FROM Appointment A
	INNER JOIN Schedule B
	ON A.ScheduleID = B.ScheduleID
	INNER JOIN [Service] C
	ON B.ServiceID = C.ServiceID
	INNER JOIN Barber D
	ON B.BarberID = D.BarberID
	INNER JOIN TimeSlot E
	ON B.TimeSlotID = E.TimeSlotID
	INNER JOIN Account F
	ON A.AccountID = F.accountid
	WHERE A.IsCancelled = 1 OR A.IsDone = 1
	ORDER BY A.DateClicked DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSchedules]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSchedules]

AS
BEGIN
	SELECT A.ScheduleID, B.ServiceID, B.Name, C.BarberID, C.Name, A.ScheduleDate, D.TimeSlotID, D.TimeString, D.Time
	FROM Schedule A
	INNER JOIN Service B
	ON A.ServiceID = B.ServiceID
	INNER JOIN Barber C
	ON A.BarberID = C.BarberID
	INNER JOIN TimeSlot D
	ON A.TimeSlotID = D.TimeSlotID
	WHERE IsBooked = 0 AND IsDone = 0
	ORDER BY B.Name, A.ScheduleDate
END
GO
/****** Object:  StoredProcedure [dbo].[spGetService]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetService] 
@serviceid int

AS
BEGIN
	SELECT ServiceID, Name, Price
	FROM Service
	WHERE ServiceID = @serviceid
END
GO
/****** Object:  StoredProcedure [dbo].[spGetServiceBarbers]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetServiceBarbers]
@serviceid int

AS
BEGIN
	SELECT C.BarberID, C.Name
	FROM Schedule A
	INNER JOIN Service B
	ON A.ServiceID = B.ServiceID
	INNER JOIN Barber C
	ON A.BarberID = C.BarberID
	WHERE A.ServiceID = @serviceid
	GROUP BY C.BarberID, C.Name
END
GO
/****** Object:  StoredProcedure [dbo].[spGetServiceBarberScheduleDates]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetServiceBarberScheduleDates]
@serviceid int,
@barberid int

AS
BEGIN
	SELECT A.ScheduleDate
	FROM Schedule A
	INNER JOIN TimeSlot B
	ON A.TimeSlotID = B.TimeSlotID
	WHERE A.ServiceID = @serviceid AND A.BarberID = @barberid AND A.IsBooked = 0
	GROUP BY A.ScheduleDate
END
GO
/****** Object:  StoredProcedure [dbo].[spGetServiceBarberScheduleDateTimes]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetServiceBarberScheduleDateTimes]
@serviceid int,
@barberid int,
@scheduledate date

AS
BEGIN
	SELECT B.TimeSlotID, B.TimeString, B.Time
	FROM Schedule A
	INNER JOIN TimeSlot B
	ON A.TimeSlotID = B.TimeSlotID
	WHERE A.ServiceID = @serviceid AND A.BarberID = @barberid AND A.ScheduleDate = @scheduledate AND A.IsBooked = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spGetServices]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetServices]

AS
BEGIN
	SELECT ServiceID, Name, Price
	FROM Service
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTimeSlots]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetTimeSlots]
	
AS
BEGIN
	SELECT TimeSlotID, TimeString, Time
	FROM TimeSlot
	ORDER BY Time ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetUsername]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetUsername]
@accountid int

AS
BEGIN
	SELECT username
	FROM Account
	WHERE accountid = @accountid
END
GO
/****** Object:  StoredProcedure [dbo].[spIsAdmin]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spIsAdmin]
@accountid int

AS
BEGIN
	SELECT admin
	FROM Account
	WHERE accountid = @accountid
END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spLogin]
@email varchar(50),
@password varchar(32)

AS
BEGIN
	IF EXISTS (SELECT A.accountid
				FROM AccountDetails A
				INNER JOIN Account B
				ON A.accountid = B.accountid
				WHERE A.email = @email AND B.[password] = @password)
	BEGIN
		DECLARE @accountid int

		SET @accountid = (SELECT A.accountid
						FROM AccountDetails A
						INNER JOIN Account B
						ON A.accountid = B.accountid
						WHERE A.email = @email AND B.[password] = @password)

		UPDATE Account
		SET lastlogin = GETDATE()
		WHERE accountid = @accountid

		SELECT @accountid
	END
	ELSE
	BEGIN
		SELECT CAST(-1 as int)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spRegister]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spRegister]
@username varchar(20),
@firstname varchar(50),
@lastname varchar(50),
@email varchar(50),
@password varchar(32)

AS
BEGIN
	IF EXISTS (SELECT * FROM Account WHERE Username = @username)
		BEGIN
			SELECT CAST(-69 as int)
		END
	ELSE IF EXISTS (SELECT * FROM AccountDetails WHERE email = @email)
		BEGIN
			SELECT CAST(-6969 as int)
		END
	ELSE
		BEGIN
			BEGIN TRAN
			DECLARE @accountid int

			INSERT INTO Account(username, password, registration) VALUES(@username, @password, GETDATE())
	
			SET @accountid = SCOPE_IDENTITY()

			INSERT INTO AccountDetails(accountid, firstname, lastname, email) VALUES(@accountid, @firstname, @lastname, @email)

			IF @@ERROR <> 0
				BEGIN
					ROLLBACK
					SELECT CAST(-1 as int)
				END
			ELSE
				BEGIN
					COMMIT
					SELECT CAST(1 as int)
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveUserContactSettings]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSaveUserContactSettings]
@accountid int,
@address varchar(MAX),
@contactno varchar(20)

AS
BEGIN
	UPDATE AccountDetails
	SET address = @address,
		contactno = @contactno
	WHERE accountid = @accountid
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveUserIntroduction]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSaveUserIntroduction]
@accountid int,
@introduction varchar(200)

AS
BEGIN
	UPDATE AccountDetails
	SET introduction = @introduction
	WHERE accountid = @accountid
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveUserSettings]    Script Date: Feb 17, 2021 4:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSaveUserSettings]
@accountid int,
@firstname varchar(50),
@lastname varchar(50),
@gender char(1) = null,
@birthday date = null

AS
BEGIN
	UPDATE AccountDetails
	SET firstname = @firstname,
		lastname = @lastname,
		gender = @gender,
		birthday = @birthday
	WHERE accountid = @accountid
END
GO
