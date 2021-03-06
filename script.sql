USE [softdew_ats]
GO
/****** Object:  Table [dbo].[Asset_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NULL,
	[m_Category_ID] [int] NOT NULL,
	[m_Child_Category_ID] [int] NULL,
	[m_Sub_Child_Category] [int] NULL,
	[m_Site_ID] [int] NULL,
	[m_Building_ID] [int] NULL,
	[m_Floor_ID] [int] NULL,
	[m_Room_ID] [int] NULL,
	[Supplier_ID] [int] NULL,
	[m_Department_ID] [int] NULL,
	[m_Custodian_ID] [int] NULL,
	[m_Section_ID] [int] NULL,
	[Manufacturer] [varchar](100) NULL,
	[Brand] [varchar](50) NULL,
	[m_model_ID] [int] NULL,
	[Value] [varchar](50) NULL,
	[Serial_Number] [varchar](20) NULL,
	[m_Ownership_ID] [int] NULL,
	[Date_of_purchase] [date] NULL,
	[Warranty_Expiry_Date] [date] NULL,
	[Description] [varchar](250) NULL,
	[Image] [varchar](50) NULL,
	[Reference1] [varchar](20) NULL,
	[Reference2] [varchar](20) NULL,
	[General_Remarks] [varchar](250) NULL,
	[Is_Approval_Needs] [int] NOT NULL,
	[Approval_User_ID] [int] NULL,
	[Is_Approved] [int] NULL,
	[m_Condition_ID] [int] NULL,
	[source_type] [int] NULL,
	[excel_upload_id] [int] NULL,
	[Quantity] [int] NULL,
	[Parent_ID] [int] NULL,
	[Created_By] [int] NOT NULL,
	[Date_of_Creation] [datetime] NOT NULL,
	[Audit_Status] [int] NOT NULL,
 CONSTRAINT [PK_Asset_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset_History]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset_History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Asset_ID] [int] NULL,
	[Asset_Code] [varchar](15) NULL,
	[P_Site_ID] [int] NULL,
	[P_Building_ID] [int] NULL,
	[P_Floor_ID] [int] NULL,
	[P_Room_ID] [int] NULL,
	[P_Department_ID] [int] NULL,
	[P_Custodian_ID] [int] NULL,
	[P_Condition_ID] [int] NULL,
	[N_Site_ID] [int] NULL,
	[N_Building_ID] [int] NULL,
	[N_Floor_ID] [int] NULL,
	[N_Room_ID] [int] NULL,
	[N_Department_ID] [int] NULL,
	[N_Custodian_ID] [int] NULL,
	[N_Condition_ID] [int] NULL,
	[Request_UserID] [int] NOT NULL,
	[Approval_UserID] [int] NULL,
	[Remarks] [varchar](250) NULL,
	[m_Action_Type] [int] NULL,
	[Status] [int] NULL,
	[HHT_Time] [varchar](50) NULL,
	[Date_of_Request] [datetime] NOT NULL,
	[Date_of_Approval] [datetime] NULL,
	[m_Category_ID] [int] NULL,
	[m_Child_Category_ID] [int] NULL,
	[m_Sub_Child_Category] [int] NULL,
	[Supplier_ID] [int] NULL,
	[m_Section_ID] [int] NULL,
	[Manufacturer] [varchar](100) NULL,
	[Brand] [varchar](50) NULL,
	[m_model_ID] [int] NULL,
	[Value] [varchar](50) NULL,
	[Serial_Number] [varchar](20) NULL,
	[m_Ownership_ID] [int] NULL,
	[Date_of_purchase] [date] NULL,
	[Warranty_Expiry_Date] [date] NULL,
	[Description] [varchar](250) NULL,
	[Image] [varchar](50) NULL,
	[General_Remarks] [varchar](250) NULL,
	[Is_Approval_Needs] [int] NULL,
	[Approval_User_ID] [int] NULL,
	[Audit_Status] [int] NULL,
	[Audit_Remarks] [varchar](250) NULL,
 CONSTRAINT [PK_Asset_Transfer_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset_Repair_History]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset_Repair_History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Asset_ID] [int] NULL,
	[GetPass_No] [varchar](20) NULL,
	[Issuer_Name] [varchar](50) NULL,
	[Email_ID] [varchar](50) NULL,
	[Mobile_No] [varchar](15) NULL,
	[Address] [varchar](128) NULL,
	[Estimated_Cost] [varchar](50) NULL,
	[Actual_Repair_Cost] [varchar](50) NULL,
	[m_Status_ID] [int] NULL,
	[Issued_By] [int] NULL,
	[Out_Remarks] [varchar](250) NULL,
	[In_Remarks] [varchar](250) NULL,
	[Date_of_Creation] [datetime] NULL,
	[Take_Date] [datetime] NULL,
 CONSTRAINT [PK_Asset_Repair_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asset_Sow_Culumn]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset_Sow_Culumn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [bit] NULL,
	[Category] [bit] NULL,
	[Child_Category] [bit] NULL,
	[Sub_Child_Category] [bit] NULL,
	[Site] [bit] NULL,
	[Building] [bit] NULL,
	[Floor] [bit] NULL,
	[Room] [bit] NULL,
	[Supplier] [bit] NULL,
	[Department] [bit] NULL,
	[Custodian] [bit] NULL,
	[Section] [bit] NULL,
	[Manufacturer] [bit] NULL,
	[Brand] [bit] NULL,
	[model] [bit] NULL,
	[Value] [bit] NULL,
	[Serial_Number] [bit] NULL,
	[Ownership] [bit] NULL,
	[Date_of_purchase] [bit] NULL,
	[Warranty_Expiry_Date] [bit] NULL,
	[Description] [bit] NULL,
	[Image] [bit] NULL,
	[Reference1] [bit] NULL,
	[Reference2] [bit] NULL,
	[General_Remarks] [bit] NULL,
	[Approval_User] [bit] NULL,
	[Condition] [bit] NULL,
	[source_type] [bit] NULL,
	[Created_By] [bit] NULL,
	[Date_of_Creation] [bit] NULL,
 CONSTRAINT [PK_Asset_Sow_Culumn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Contact_Person_Name] [varchar](50) NOT NULL,
	[Mobile] [varchar](13) NOT NULL,
	[Is_Supplier] [int] NOT NULL,
	[m_Supplied_Category_ID] [int] NULL,
	[m_Child_Category_ID] [int] NULL,
	[m_Sub_Child_Category_ID] [int] NULL,
	[Created_By] [int] NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_Company_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excel_Upload_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excel_Upload_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[File_Name] [varchar](50) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Total_Count] [int] NOT NULL,
	[Uploaded_On] [datetime] NOT NULL,
 CONSTRAINT [PK_excel_upload_details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exception_History]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exception_History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[source_file] [varchar](100) NULL,
	[page] [varchar](50) NULL,
	[exception] [varchar](250) NULL,
	[exception_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Exception_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Action_Type]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Action_Type](
	[ID] [int] NULL,
	[Action] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Asset_Condition]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Asset_Condition](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Is_Active] [int] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Date_of_Creation] [datetime] NOT NULL,
 CONSTRAINT [PK_m_Asset_Condition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_barcode_setting]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_barcode_setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Prefix] [varchar](3) NULL,
	[Firest_Field] [varchar](50) NULL,
	[Second_Field] [varchar](50) NULL,
	[Third_Field] [varchar](50) NULL,
	[Client_Logo] [varchar](50) NULL,
	[m_Status_ID] [int] NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_m_barcode_setting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Category_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Category_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[m_Depreciation_ID] [int] NOT NULL,
	[Useful_life] [int] NULL,
	[Salvage_value] [int] NULL,
	[Parent_ID] [int] NOT NULL,
	[Created_By] [int] NULL,
	[Date_of_Creation] [datetime] NOT NULL,
 CONSTRAINT [PK_Category_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Department_Custodian_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Department_Custodian_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email_ID] [varchar](50) NULL,
	[Code] [varchar](20) NOT NULL,
	[Parent_ID] [int] NULL,
	[Status] [int] NOT NULL,
	[Created_By] [int] NOT NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_Department_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Depreciation_Algorithm]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Depreciation_Algorithm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Algorithm] [varchar](50) NULL,
	[Formula] [varchar](50) NULL,
	[Created_By] [int] NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_m_Depreciation_Algorithm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Email_Setting]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Email_Setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SMPTServer] [varchar](50) NOT NULL,
	[SMPTPort] [varchar](10) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[ConfirmPassword] [varchar](15) NULL,
	[SSL] [bit] NOT NULL,
	[m_Status_ID] [int] NOT NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_m_Email_Setting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_General_Setting]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_General_Setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Client_Logo] [varchar](50) NULL,
	[m_Status_ID] [int] NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_m_General_Setting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Location_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Location_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Code] [varchar](20) NULL,
	[Parent_ID] [int] NULL,
	[Created_By] [int] NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_Location_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Master_Action]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Master_Action](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [varchar](50) NULL,
 CONSTRAINT [PK_m_Master_Action] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Model_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Model_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Code] [varchar](10) NULL,
	[Created_by] [int] NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_m_Model_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Ownership]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Ownership](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[Is_Active] [int] NULL,
 CONSTRAINT [PK_m_Own_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Report_Color]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Report_Color](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HeaderRow_ForColor] [varchar](20) NOT NULL,
	[HeaderRow_BackColor] [varchar](20) NOT NULL,
	[RowStyle_BackColor] [varchar](20) NOT NULL,
	[m_Status_ID] [int] NOT NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_m_Report_Color] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Role_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Role_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_m_Role_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Section_Details]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Section_Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Created_By] [int] NULL,
	[Date_of_Creation] [datetime] NULL,
 CONSTRAINT [PK_m_Section_Details] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Transfer_Request_Status]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Transfer_Request_Status](
	[ID] [int] NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Modification_History]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Modification_History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DB_ID] [int] NULL,
	[Master_Type] [varchar](100) NULL,
	[m_Master_Action_Type] [int] NULL,
	[Current_Value] [varchar](250) NULL,
	[New_Value] [varchar](250) NULL,
	[Change_Date] [datetime] NULL,
 CONSTRAINT [PK_Master_Modification_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sync_History]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sync_History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[File_Name] [varchar](100) NULL,
	[Date_of_Creation] [datetime] NULL,
	[Pass] [int] NULL,
	[Fail] [int] NULL,
 CONSTRAINT [PK_Sync_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[MobileNo] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Selected_Role] [varchar](50) NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Is_active] [int] NOT NULL,
	[Created_By] [int] NOT NULL,
	[is_HHT] [int] NOT NULL,
	[Date_of_Creation] [datetime] NOT NULL,
 CONSTRAINT [PK__webpages__8AFACE1A0CBAE877] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 11/13/2019 12:42:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asset_Details] ADD  CONSTRAINT [DF_Asset_Details_Date_of_Creation]  DEFAULT (getdate()) FOR [Date_of_Creation]
GO
ALTER TABLE [dbo].[Asset_Details] ADD  CONSTRAINT [DF__Asset_Det__Audit__46B27FE2]  DEFAULT ((1)) FOR [Audit_Status]
GO
ALTER TABLE [dbo].[m_Category_Details] ADD  CONSTRAINT [DF_m_Category_Details_Date_of_Creation]  DEFAULT (getdate()) FOR [Date_of_Creation]
GO
ALTER TABLE [dbo].[m_Model_Details] ADD  CONSTRAINT [DF_m_Model_Details_Date_of_Creation]  DEFAULT (getdate()) FOR [Date_of_Creation]
GO
ALTER TABLE [dbo].[m_Section_Details] ADD  CONSTRAINT [DF_m_Section_Details_Date_of_Creation]  DEFAULT (getdate()) FOR [Date_of_Creation]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Approve,2=Rejected' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Asset_History', @level2type=N'COLUMN',@level2name=N'Status'
GO
