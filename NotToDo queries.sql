USE [TODO]
GO

INSERT INTO [dbo].[Todo]
           ([name]
           ,[details]
           ,[dodate]
           ,[userid])
     VALUES
           (<name, varchar(100),>
           ,<details, varchar(5000),>
           ,<dodate, datetime,>
           ,<userid, int,>)
GO


SELECT [empid] ,[name] ,[details] ,CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, [dodate]), DATENAME(TzOffset, SYSDATETIMEOFFSET())))  AS dodate ,  
dodate as Dodate2 FROM [dbo].[Todo] WHERE Dodate >= GETUTCDATE()

--SELECT SWITCHOFFSET(YourOriginalDateTime AT TIME ZONE 'Pacific Standard Time', '+00:00')

select
    'data source=' + @@servername +
    ';initial catalog=' + db_name() +
    case type_desc
        when 'WINDOWS_LOGIN' 
            then ';trusted_connection=true'
        else
            ';user id=' + suser_name() + ';password=<<YourPassword>>'
    end
    as ConnectionString
from sys.server_principals
where name = suser_name()



SELECT [empid] ,[name] ,[details] ,CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, [dodate]) AT TIME ZONE 'Pacific Standard Time' AT TIME ZONE 'UTC', DATENAME(TzOffset, SYSDATETIMEOFFSET())))  AS dodate ,  
dodate as Dodate2 FROM [dbo].[Todo] WHERE Dodate >= GETUTCDATE()


declare @dt datetimeoffset = (select convert(datetimeoffset,'2015-01-01 00:15:00.0000000 +01:00'))

select [dodate] as Original
      ,convert(datetime2,[dodate],1) as Converted
      ,switchoffset([dodate],'+00:00') as Switched

	  FROM [dbo].[Todo] WHERE Dodate >= GETUTCDATE()


	  SELECT todoid ,name ,details ,CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, [dodate]), DATENAME(TzOffset, SYSDATETIMEOFFSET())))  AS dodate  FROM dbo.Todo
	  WHERE UserId = 1 AND DATEDIFF(Day,Dodate,GETUTCDATE()) = 1 OR Dodate >= GETUTCDATE() ORDER By dodate

	  SELECT * FROM Todo WHERE todoid = 20  AND userid = 4


	  SELECT todoid ,name ,details ,CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, [dodate]), DATENAME(TzOffset, SYSDATETIMEOFFSET())))  AS dodate  FROM dbo.Todo 
	  WHERE UserId = 4 
	  AND 
	  (DATEDIFF(Day,Dodate,GETUTCDATE()) = 1 OR Dodate >= GETUTCDATE()) 
	  ORDER By dodate




	  SELECT todoid ,name ,details ,CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, [dodate]), DATENAME(TzOffset, SYSDATETIMEOFFSET())))  AS dodate 
	  FROM dbo.Todo  WHERE UserId = 1 AND (DATEDIFF(Day,Dodate,GETUTCDATE()) = 1 OR Dodate >= GETUTCDATE()) ORDER By dodate


	  
	  SELECT *
	  FROM dbo.Todo  WHERE UserId = 1 and
	   DATEDIFF(Day,Dodate,GETUTCDATE()) <= 1 )
	  and Dodate >= GETUTCDATE() ORDER By dodate


	  USE [TODO]
GO

INSERT INTO [dbo].[Users]
           ([Username]
           ,[Pwd]
           ,[userRole]
           ,[UserID])
     VALUES
           ('Mary'
           ,'password'
           ,'User'
           ,5)
GO


SELECT * FROM Users


SELECT TOP (1000) [uname]
      ,[Pwd]
      ,[userRole]
  FROM [TODO].[dbo].[Users]

--INSERT into dbo.Todo values('Smile', 'often', '2024-07-10T07:22:00')

SELECT GETDATE()
SELECT * from Todo  WHERE Dodate >= GETDATE()



SELECT [empid]
      ,[name]
      ,[details]
      ,[dodate] at time zone 'UTC' 
	  ,[dodate] at time zone 'AUS Eastern Standard Time'  
	  ,CONVERT(datetime, 
               SWITCHOFFSET(CONVERT(datetimeoffset, 
                                    [dodate]), 
                            DATENAME(TzOffset, SYSDATETIMEOFFSET()))) 
       AS dodate
  FROM [dbo].[Todo]


  SELECT [empid] ,[name] ,[details] 	  ,CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, [dodate]), DATENAME(TzOffset, SYSDATETIMEOFFSET())))   AS dodate  FROM [dbo].[Todo]



select @example at time zone 'UTC' at time zone 'AUS Eastern Standard Time'  


SELECT [empid] ,[name] ,[details] ,CONVERT(datetime, SWITCHOFFSET(CONVERT(datetimeoffset, [dodate]), DATENAME(TzOffset, SYSDATETIMEOFFSET())))  AS dodate ,  dodate as Dodate2 FROM [dbo].[Todo] WHERE Dodate2 >= GETDATE()





