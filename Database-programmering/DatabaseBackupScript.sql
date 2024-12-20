USE [h3]
GO
/****** Object:  Table [dbo].[Core_8_0_Teams]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_Teams](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Core_8_0_Teams] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_8_0_Students]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](100) NOT NULL,
	[StudentLastName] [nvarchar](100) NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_Core_8_0_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Student_Team_View]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Student_Team_View]
AS
SELECT dbo.Core_8_0_Students.StudentID, dbo.Core_8_0_Students.TeamID, dbo.Core_8_0_Students.StudentLastName, dbo.Core_8_0_Students.StudentName, dbo.Core_8_0_Teams.TeamID AS Expr1, dbo.Core_8_0_Teams.TeamName
FROM     dbo.Core_8_0_Students INNER JOIN
                  dbo.Core_8_0_Teams ON dbo.Core_8_0_Students.TeamID = dbo.Core_8_0_Teams.TeamID
GO
/****** Object:  Table [dbo].[Core_8_0_Courses]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Core_8_0_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core_8_0_StudentCourses]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core_8_0_StudentCourses](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_Core_8_0_StudentCourses] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Student_Team_Course_View]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Student_Team_Course_View]
AS
SELECT dbo.Core_8_0_Students.StudentID, dbo.Core_8_0_Students.StudentName, dbo.Core_8_0_Students.StudentLastName, dbo.Core_8_0_Students.TeamID, dbo.Core_8_0_Teams.TeamName, dbo.Core_8_0_Teams.TeamID AS Expr1, 
                  dbo.Core_8_0_StudentCourses.CourseID, dbo.Core_8_0_StudentCourses.StudentID AS Expr2, dbo.Core_8_0_Courses.CourseName, dbo.Core_8_0_Courses.CourseID AS Expr3
FROM     dbo.Core_8_0_Students INNER JOIN
                  dbo.Core_8_0_Teams ON dbo.Core_8_0_Students.TeamID = dbo.Core_8_0_Teams.TeamID INNER JOIN
                  dbo.Core_8_0_StudentCourses ON dbo.Core_8_0_Students.StudentID = dbo.Core_8_0_StudentCourses.StudentID INNER JOIN
                  dbo.Core_8_0_Courses ON dbo.Core_8_0_StudentCourses.CourseID = dbo.Core_8_0_Courses.CourseID
GO
/****** Object:  View [dbo].[Student_Team_Course_Collected_View]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Student_Team_Course_Collected_View]
AS
SELECT dbo.Core_8_0_Students.StudentID, dbo.Core_8_0_Students.StudentName, dbo.Core_8_0_Students.StudentLastName, dbo.Core_8_0_Students.TeamID, dbo.Core_8_0_Teams.TeamName, dbo.Core_8_0_Teams.TeamID AS Expr1, 
                  dbo.Core_8_0_StudentCourses.CourseID, dbo.Core_8_0_StudentCourses.StudentID AS Expr2, dbo.Core_8_0_Courses.CourseName, dbo.Core_8_0_Courses.CourseID AS Expr3
FROM     dbo.Core_8_0_Students INNER JOIN
                  dbo.Core_8_0_Teams ON dbo.Core_8_0_Students.TeamID = dbo.Core_8_0_Teams.TeamID INNER JOIN
                  dbo.Core_8_0_StudentCourses ON dbo.Core_8_0_Students.StudentID = dbo.Core_8_0_StudentCourses.StudentID INNER JOIN
                  dbo.Core_8_0_Courses ON dbo.Core_8_0_StudentCourses.CourseID = dbo.Core_8_0_Courses.CourseID
GO
/****** Object:  View [dbo].[Student_Team_Course_Collected1_View]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Student_Team_Course_Collected1_View]
AS
SELECT TOP (100) PERCENT s.StudentID, s.StudentName, s.StudentLastName, STRING_AGG(c.CourseName, ', ') AS Courses, COUNT(c.CourseName) AS Num, s.TeamID, dbo.Core_8_0_Teams.TeamID AS Expr1, 
                  dbo.Core_8_0_Teams.TeamName
FROM     dbo.Core_8_0_Students AS s INNER JOIN
                  dbo.Core_8_0_StudentCourses AS sc ON s.StudentID = sc.StudentID INNER JOIN
                  dbo.Core_8_0_Courses AS c ON c.CourseID = sc.CourseID INNER JOIN
                  dbo.Core_8_0_Teams ON s.TeamID = dbo.Core_8_0_Teams.TeamID
GROUP BY s.StudentName, s.StudentID, s.StudentLastName, s.TeamID, dbo.Core_8_0_Teams.TeamID, dbo.Core_8_0_Teams.TeamName
ORDER BY Num DESC
GO
SET IDENTITY_INSERT [dbo].[Core_8_0_Courses] ON 

INSERT [dbo].[Core_8_0_Courses] ([CourseID], [CourseName]) VALUES (1, N'Matematik')
INSERT [dbo].[Core_8_0_Courses] ([CourseID], [CourseName]) VALUES (2, N'Fysik')
INSERT [dbo].[Core_8_0_Courses] ([CourseID], [CourseName]) VALUES (3, N'Kemi')
INSERT [dbo].[Core_8_0_Courses] ([CourseID], [CourseName]) VALUES (4, N'WPF')
INSERT [dbo].[Core_8_0_Courses] ([CourseID], [CourseName]) VALUES (5, N'ClientSide')
INSERT [dbo].[Core_8_0_Courses] ([CourseID], [CourseName]) VALUES (6, N'ServerSide')
SET IDENTITY_INSERT [dbo].[Core_8_0_Courses] OFF
GO
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (1, 1)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (3, 1)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (1, 2)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (4, 2)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (1, 3)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (2, 3)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (3, 3)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (4, 3)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (6, 3)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (2, 4)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (3, 4)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (5, 4)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (6, 5)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (1, 6)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (4, 6)
INSERT [dbo].[Core_8_0_StudentCourses] ([StudentID], [CourseID]) VALUES (5, 6)
GO
SET IDENTITY_INSERT [dbo].[Core_8_0_Students] ON 

INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (1, N'Aksel', N'Binderup Kristensen', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (2, N'Casper', N'Simon Jensen', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (3, N'Daniel', N'Vinther Andersen', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (4, N'Jacob', N'malthe Nielsen', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (5, N'Victor', N'E. Frabndsen', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (6, N'William', N'Sørin Ford', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (7, N'Test', N'Testesen', 3)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (8, N'Lars', N'Pedersen', 4)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (9, N'Test', N'Pedersen', 3)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (10, N'Jette', N'Pedersen', 3)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (11, N'Thomas', N'Pedersen', 3)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (12, N'Marie Elisabeth', N'Thise Pedersen', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (13, N'Stribe Kat', N'Pedersen', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (14, N'Jens', N'Pedersen', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (15, N't', N'e', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (16, N'a', N'b', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (17, N'a', N'b', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (18, N'c', N'd', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (19, N'c', N'd', 2)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (20, N'Stribe', N'Vagn', 3)
INSERT [dbo].[Core_8_0_Students] ([StudentID], [StudentName], [StudentLastName], [TeamID]) VALUES (21, N'Stribe', N'Vagn', 3)
SET IDENTITY_INSERT [dbo].[Core_8_0_Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Core_8_0_Teams] ON 

INSERT [dbo].[Core_8_0_Teams] ([TeamID], [TeamName]) VALUES (1, N'h1pd070124')
INSERT [dbo].[Core_8_0_Teams] ([TeamID], [TeamName]) VALUES (2, N'h2pd070124')
INSERT [dbo].[Core_8_0_Teams] ([TeamID], [TeamName]) VALUES (3, N'h3pd101124')
INSERT [dbo].[Core_8_0_Teams] ([TeamID], [TeamName]) VALUES (4, N'h4pd101124')
SET IDENTITY_INSERT [dbo].[Core_8_0_Teams] OFF
GO
ALTER TABLE [dbo].[Core_8_0_StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_Core_8_0_StudentCourses_Core_8_0_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Core_8_0_Courses] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_8_0_StudentCourses] CHECK CONSTRAINT [FK_Core_8_0_StudentCourses_Core_8_0_Courses_CourseID]
GO
ALTER TABLE [dbo].[Core_8_0_StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_Core_8_0_StudentCourses_Core_8_0_Students_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Core_8_0_Students] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_8_0_StudentCourses] CHECK CONSTRAINT [FK_Core_8_0_StudentCourses_Core_8_0_Students_StudentID]
GO
ALTER TABLE [dbo].[Core_8_0_Students]  WITH CHECK ADD  CONSTRAINT [FK_Core_8_0_Students_Core_8_0_Teams_TeamID] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Core_8_0_Teams] ([TeamID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Core_8_0_Students] CHECK CONSTRAINT [FK_Core_8_0_Students_Core_8_0_Teams_TeamID]
GO
/****** Object:  StoredProcedure [dbo].[Student_Team_Course_Collected_SP]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Student_Team_Course_Collected_SP] 
	-- Add the parameters for the stored procedure here
	-- <@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (100) PERCENT s.StudentID, s.StudentName, s.StudentLastName, STRING_AGG(c.CourseName, ', ') AS Courses, 
	                 STRING_AGG(c.CourseID, ', ') AS CourseIDs, COUNT(c.CourseName) AS NumberCourses, s.TeamID, 
                     dbo.Core_8_0_Teams.TeamName	
	FROM     dbo.Core_8_0_Students AS s INNER JOIN
                  dbo.Core_8_0_StudentCourses AS sc ON s.StudentID = sc.StudentID INNER JOIN
                  dbo.Core_8_0_Courses AS c ON c.CourseID = sc.CourseID INNER JOIN
                  dbo.Core_8_0_Teams ON s.TeamID = dbo.Core_8_0_Teams.TeamID
	GROUP BY s.StudentName, s.StudentID, s.StudentLastName, s.TeamID, dbo.Core_8_0_Teams.TeamID, dbo.Core_8_0_Teams.TeamName
	ORDER BY NumberCourses DESC
END
GO
/****** Object:  StoredProcedure [dbo].[Student_Team_Course_Collected_SP_By_Student_ID]    Script Date: 21-11-2024 08:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Student_Team_Course_Collected_SP_By_Student_ID] 
	-- Add the parameters for the stored procedure here
	-- <@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	@StudentID int
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (100) PERCENT s.StudentID, s.StudentName, s.StudentLastName, STRING_AGG(c.CourseName, ', ') AS Courses, 
	                 STRING_AGG(c.CourseID, ', ') AS CourseIDs, COUNT(c.CourseName) AS NumberCourses, s.TeamID, 
                     dbo.Core_8_0_Teams.TeamName	
	FROM     dbo.Core_8_0_Students AS s INNER JOIN
                  dbo.Core_8_0_StudentCourses AS sc ON s.StudentID = sc.StudentID INNER JOIN
                  dbo.Core_8_0_Courses AS c ON c.CourseID = sc.CourseID INNER JOIN
                  dbo.Core_8_0_Teams ON s.TeamID = dbo.Core_8_0_Teams.TeamID
	WHERE s.StudentID = @StudentID
	GROUP BY s.StudentName, s.StudentID, s.StudentLastName, s.TeamID, dbo.Core_8_0_Teams.TeamID, dbo.Core_8_0_Teams.TeamName
	ORDER BY NumberCourses DESC

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Core_8_0_Students"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Teams"
            Begin Extent = 
               Top = 7
               Left = 308
               Bottom = 126
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_StudentCourses"
            Begin Extent = 
               Top = 7
               Left = 550
               Bottom = 126
               Right = 744
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Courses"
            Begin Extent = 
               Top = 7
               Left = 792
               Bottom = 126
               Right = 986
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Team_Course_Collected_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Team_Course_Collected_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sc"
            Begin Extent = 
               Top = 7
               Left = 324
               Bottom = 126
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 7
               Left = 582
               Bottom = 126
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Teams"
            Begin Extent = 
               Top = 7
               Left = 840
               Bottom = 126
               Right = 1050
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Team_Course_Collected1_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Team_Course_Collected1_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Core_8_0_Students"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Teams"
            Begin Extent = 
               Top = 7
               Left = 308
               Bottom = 126
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_StudentCourses"
            Begin Extent = 
               Top = 7
               Left = 550
               Bottom = 126
               Right = 744
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Courses"
            Begin Extent = 
               Top = 7
               Left = 792
               Bottom = 126
               Right = 986
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Team_Course_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Team_Course_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -120
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Core_8_0_Students"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Core_8_0_Teams"
            Begin Extent = 
               Top = 127
               Left = 308
               Bottom = 246
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Team_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Student_Team_View'
GO
