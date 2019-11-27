using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Threading.Tasks;
using System.Data.SqlClient;
namespace DataUpload
{
    class Program
    {
        private static string connstr = String.Empty;
        static void Main(string[] args)
        {
            connstr= System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection sqlCon = new SqlConnection(connstr);
            try
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("truncate table m_Department_Custodian_Details;truncate table m_Category_Details ;truncate table m_Location_Details;", sqlCon);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Console.ReadKey();
            }
         

            UploadCategory();
            UploadDepartmentCustodian();
            UploadLocation();
            UploadAssets();
        }
        static void UploadLocation()
        {
            string sqlQuery =
                "INSERT INTO [dbo].[m_Location_Details] ([Name],[Code],[Parent_ID],[Created_By],[Date_of_Creation])  ";
            sqlQuery = sqlQuery +
                       "  VALUES('{0}','{1}', '{2}', '{3}',{4});SELECT SCOPE_IDENTITY();";

            string con =
                @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Temp\Location.xls;" +
                @"Extended Properties='Excel 8.0;HDR=Yes;'";
            SqlConnection sqlCon = new SqlConnection(connstr);
            using (OleDbConnection connection = new OleDbConnection(con))
            {
                connection.Open();

                DataTable dTLocations = new DataTable();
                OleDbCommand command = new OleDbCommand("select * from [Location$]", connection);
                OleDbDataAdapter adapter = new OleDbDataAdapter(command);
                adapter.Fill(dTLocations);
                //using (OleDbDataReader dr = command.ExecuteReader())
                //{
                //    while (dr.Read())
                //    {
                //    }
                //}
                sqlCon.Open();
                foreach (DataRow row in dTLocations.Rows)
                {
                    string locationName = string.Empty;

                    if (row[1].ToString().Length > 100)
                    {
                        locationName = row[1].ToString().Substring(0, 99);
                    }
                    else {
                        locationName = row[1].ToString();
                    }

                    string locationQuery = string.Format(sqlQuery, locationName.Replace("'", "''"), row[0].ToString(), "0", "1", "GETDATE()");
                    string subCategoryQuery = string.Empty;
                    SqlCommand cmd = new SqlCommand(locationQuery, sqlCon);
                    string parentID = cmd.ExecuteScalar().ToString();
                    //string subCategory = row[3].ToString();

                    //if (subCategory.Contains('*'))
                    //{
                    //    int codemap = 1;
                    //    string[] subCategories = subCategory.Split('*');
                    //    foreach (var category in subCategories)
                    //    {

                    //        subCategoryQuery = string.Format(sqlQuery, category.Replace("'", "''"), row[2].ToString() + "-" + codemap.ToString(), "0", "0", "0", parentID, "1", "GETDATE()");
                    //        cmd = new SqlCommand(subCategoryQuery, sqlCon);
                    //        cmd.ExecuteNonQuery();
                    //        codemap++;
                    //    }
                    //}
                    //else
                    //{
                    //    subCategoryQuery = string.Format(sqlQuery, subCategory.Replace("'", "''"), row[2].ToString() + "-1", "0", "0", "0", parentID, "1", "GETDATE()");
                    //    cmd = new SqlCommand(subCategoryQuery, sqlCon);
                    //    cmd.ExecuteNonQuery();
                    //}
                    //sqlCon.Close();
                }
            }
        }
        static void UploadCategory()
        {
            string sqlQuery =
                "SET QUOTED_IDENTIFIER OFF; INSERT INTO[dbo].[m_Category_Details] ([Name],[Code],[m_Depreciation_ID],[Useful_life],[Salvage_value],[Parent_ID],[Created_By],[Date_of_Creation])";
            sqlQuery = sqlQuery +
                       "  VALUES(\"{0}\",\"{1}\", \"{2}\", \"{3}\",\"{4}\",\"{5}\",\"{6}\",{7});SELECT SCOPE_IDENTITY(); SET QUOTED_IDENTIFIER ON;";
            
            string con =
                @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Temp\Categories.xls;" +
                @"Extended Properties='Excel 8.0;HDR=Yes;'";
            SqlConnection sqlCon=new SqlConnection(connstr);
            using (OleDbConnection connection = new OleDbConnection(con))
            {
                connection.Open();
                
                DataTable dTCategories = new DataTable();
                OleDbCommand command = new OleDbCommand("select * from [category$]", connection);
                OleDbDataAdapter adapter = new OleDbDataAdapter(command);
                adapter.Fill(dTCategories);
                //using (OleDbDataReader dr = command.ExecuteReader())
                //{
                //    while (dr.Read())
                //    {
                //    }
                //}
                foreach (DataRow  row in dTCategories.Rows)
                {

                   string mainCategoryQuery=  string.Format(sqlQuery, row[0].ToString().Replace("'","''"), row[2].ToString(),"0", "0","0","0","1", "GETDATE()" );
                        string subCategoryQuery = string.Empty;
                    SqlCommand cmd = new SqlCommand(mainCategoryQuery, sqlCon);
                    sqlCon.Open();
                    string parentID=cmd.ExecuteScalar().ToString();
                    string subCategory = row[3].ToString();
                  
                    if (subCategory.Contains('*'))
                    {
                        int codemap = 1;
                        string[] subCategories = subCategory.Split('*');
                        foreach (var category in subCategories)
                        {
                            

                                subCategoryQuery = string.Format(sqlQuery, category.Replace("'", "_"), row[2].ToString() + "-" + codemap.ToString(), "0", "0", "0", parentID, "1", "GETDATE()");
                                cmd = new SqlCommand(subCategoryQuery, sqlCon);
                                cmd.ExecuteNonQuery();
                            codemap++;
                        }
                    }
                    else
                    {
                        subCategoryQuery = string.Format(sqlQuery, subCategory.Replace("'", "''"), row[2].ToString() + "-1", "0", "0", "0", parentID, "1", "GETDATE()");
                        cmd = new SqlCommand(subCategoryQuery, sqlCon);
                        cmd.ExecuteNonQuery();
                    }
                    sqlCon.Close();
                }
            }
        }
        static void UploadDepartmentCustodian()
        {
            string sqlQuery =
                " INSERT INTO [dbo].[m_Department_Custodian_Details] ([Name] ,[Email_ID],[Code],[Parent_ID],[Status],[Created_By],[Date_of_Creation]) ";
           
            sqlQuery = sqlQuery +
                       "  VALUES ('{0}','{1}', '{2}', '{3}','{4}','{5}',{6});SELECT SCOPE_IDENTITY();";

            string con =
                @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Temp\DepCust.xls;" +
                @"Extended Properties='Excel 8.0;HDR=Yes;'";
            SqlConnection sqlCon = new SqlConnection(connstr);
            using (OleDbConnection connection = new OleDbConnection(con))
            {
                connection.Open();

                DataTable dTCustodian = new DataTable();
                DataTable dTDepartment = new DataTable();
                OleDbCommand command = new OleDbCommand("select * from [custodian$]", connection);
                OleDbDataAdapter adapter = new OleDbDataAdapter(command);
                adapter.Fill(dTCustodian);
                command = new OleDbCommand("select * from [Department$]", connection);
                 adapter = new OleDbDataAdapter(command);
                adapter.Fill(dTDepartment);
                sqlCon.Open();

                foreach (DataRow dept in dTDepartment.Rows)
                {
                    if (dept[0] != null && !string.IsNullOrEmpty(dept[0].ToString()))
                    {
                        string mainDeptQuery = string.Format(sqlQuery, dept[1].ToString().Replace("'", "''"), " ", dept[0].ToString().Trim(), "0", "1", "1", "GETDATE()");
                        string custodianQuery = string.Empty;
                        SqlCommand cmd = new SqlCommand(mainDeptQuery, sqlCon);
                        string parentID = cmd.ExecuteScalar().ToString();
                        string custodians = dept[2].ToString();
                        string custodian = string.Empty;
                        string custodianID = string.Empty;
                        if (custodians.Contains("*"))
                        {
                            string[] tempCustodians = custodians.Split('*');
                            foreach (var tempCustodian in tempCustodians)
                            {
                                custodian = dTCustodian.AsEnumerable().Where(c => c.Field<string>("m_Custodian_ID") == tempCustodian.Trim()).Select(c => c.Field<string>("CUSTODIANNAME")).First();
                                custodianQuery = string.Format(sqlQuery, custodian.Replace("'", "''"), " ", tempCustodian.ToString().Trim(), parentID, "1", "1", "GETDATE()");
                                cmd = new SqlCommand(custodianQuery, sqlCon);
                                cmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {

                            custodian = dTCustodian.AsEnumerable().Where(c => c.Field<string>("m_Custodian_ID") == custodians).Select(c => c.Field<string>("CUSTODIANNAME")).First();
                            custodianQuery = string.Format(sqlQuery, custodian.Replace("'", "''"), " ", custodians.ToString().Trim(), parentID, "1", "1", "GETDATE()");
                            cmd = new SqlCommand(custodianQuery, sqlCon);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                string tempCustodianQuery = "update m_Department_Custodian_Details set name = '1407000000' where code = '1407000000'";
                SqlCommand sqlCmd = new SqlCommand(tempCustodianQuery, sqlCon);
                sqlCmd.ExecuteNonQuery();
               
                //using (OleDbDataReader dr = command.ExecuteReader())
                //{
                //    while (dr.Read())
                //    {
                //    }
                //}
                //foreach (DataRow row in dTCategories.Rows)
                //{

                //    string mainCategoryQuery = string.Format(sqlQuery, row[0].ToString().Replace("'", "''"), row[2].ToString(), "0", "0", "0", "0", "1", "GETDATE()");
                //    string subCategoryQuery = string.Empty;
                //    SqlCommand cmd = new SqlCommand(mainCategoryQuery, sqlCon);
                //    sqlCon.Open();
                //    string parentID = cmd.ExecuteScalar().ToString();
                //    string subCategory = row[3].ToString();

                //    if (subCategory.Contains('*'))
                //    {
                //        int codemap = 1;
                //        string[] subCategories = subCategory.Split('*');
                //        foreach (var category in subCategories)
                //        {

                //            subCategoryQuery = string.Format(sqlQuery, category.Replace("'", "''"), row[2].ToString() + "-" + codemap.ToString(), "0", "0", "0", parentID, "1", "GETDATE()");
                //            cmd = new SqlCommand(subCategoryQuery, sqlCon);
                //            cmd.ExecuteNonQuery();
                //            codemap++;
                //        }
                //    }
                //    else
                //    {
                //        subCategoryQuery = string.Format(sqlQuery, subCategory.Replace("'", "''"), row[2].ToString() + "-1", "0", "0", "0", parentID, "1", "GETDATE()");
                //        cmd = new SqlCommand(subCategoryQuery, sqlCon);
                //        cmd.ExecuteNonQuery();
                //    }
                //    sqlCon.Close();
                //}
            }
        }

        static void UploadAssets()
        {
            string sqlQuery = "INSERT INTO[dbo].[Asset_Details]([Code],[m_Category_ID],[m_Child_Category_ID],[m_Sub_Child_Category],[m_Site_ID]";
            sqlQuery = sqlQuery + " ,[m_Building_ID],[m_Floor_ID],[m_Room_ID],[Supplier_ID],[m_Department_ID],[m_Custodian_ID]";
            sqlQuery = sqlQuery + ",[m_Section_ID],[Manufacturer],[Brand],[m_model_ID],[Value],[Serial_Number],[m_Ownership_ID]";
            sqlQuery = sqlQuery + ",[Date_of_purchase],[Warranty_Expiry_Date],[Description],[Image],[Reference1],[Reference2],[General_Remarks]";
            sqlQuery = sqlQuery + ",[Is_Approval_Needs],[Approval_User_ID],[Is_Approved],[m_Condition_ID],[source_type],[excel_upload_id]";
            sqlQuery = sqlQuery + ",[Quantity],[Parent_ID],[Created_By],[Date_of_Creation],[Audit_Status])";
            

            sqlQuery = sqlQuery +
                       "  VALUES ('{0}','{1}','{2}',{3},'{4}',{5},{6},{7},{8},'{9}','{10}',{11},{12},{13},{14},{15},{16},{17},{18},{19},'{20}','{21}',{22},{23},{24},'{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}',{34},'{35}') ; SELECT SCOPE_IDENTITY();";

            string con =
                @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Temp\DepCust.xls;" +
                @"Extended Properties='Excel 8.0;HDR=Yes;'";
            SqlConnection sqlCon = new SqlConnection(connstr);
            using (OleDbConnection connection = new OleDbConnection(con))
            {
                connection.Open();

                DataTable dtAsset = new DataTable();
                OleDbCommand command = new OleDbCommand("select * from [Asset$]", connection);
                OleDbDataAdapter adapter = new OleDbDataAdapter(command);
                adapter.Fill(dtAsset);
                sqlCon.Open();

                foreach (DataRow asset in dtAsset.Rows)
                {
                    if (asset["Code"] != null && !string.IsNullOrEmpty(asset["Code"].ToString()))
                    {
                        string categoryID= string.Empty, childCategoryID = string.Empty;
                        string custodianID = string.Empty, deptID= string.Empty;
                        string locationID= string.Empty;
                        string siteIDQuery = "select ID from m_Location_Details where code = '{0}'";
                        siteIDQuery = string.Format(siteIDQuery, asset["m_Site_ID"].ToString().Trim());
                        SqlCommand cmd = new SqlCommand(siteIDQuery, sqlCon);
                        locationID = cmd.ExecuteScalar().ToString();

                        string deptQuery = "select ID, Parent_ID from m_Department_Custodian_Details where parent_id in (select Id from m_Department_Custodian_Details";
deptQuery = deptQuery + " WHERE code = '{0}')  and Code = '{1}'";
                        deptQuery = string.Format(deptQuery, asset["m_Ownership_ID"].ToString(), asset["m_Custodian_ID"].ToString());
                        DataTable dtDept = new DataTable();
                        cmd = new SqlCommand(deptQuery, sqlCon);
                        SqlDataAdapter daAdapter = new SqlDataAdapter(cmd);
                        daAdapter.Fill(dtDept);
                        if (dtDept.Rows.Count > 0)
                        {
                        DataRow dept = dtDept.Rows[0];
                            custodianID = dept[0].ToString();
                            deptID = dept[1].ToString();
                        }

                        string categoryQuery = "select Id, Parent_ID from m_Category_Details where LTRIM(RTRIM(UPPER(name)))= '{0}'";
                        categoryQuery = string.Format(categoryQuery, asset["m_Child_Category_ID"].ToString().Trim().Replace("'","_"));
                        cmd = new SqlCommand(categoryQuery, sqlCon);
                        daAdapter = new SqlDataAdapter(cmd);
                        DataTable dtCategory= new DataTable();
                        daAdapter.Fill(dtCategory);
                        if (dtCategory.Rows.Count > 0)
                        {
                            DataRow category = dtCategory.Rows[0];
                            childCategoryID = category[0].ToString();
                            categoryID = category[1].ToString();
                        }
                        

                        string assetQuery = string.Format(sqlQuery, asset["Code"].ToString(), categoryID.ToString(), childCategoryID.ToString(), "NULL", locationID.ToString(), "NULL", "NULL", "NULL", "NULL", deptID.ToString(), custodianID.ToString(), "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL", asset["Description"].ToString().Replace("'","").Replace(":", "")," " , "NULL", "NULL", "NULL", 0, 0, 1, 2, 0, 0, 1, 0, 1, "getdate()", 1);

                        cmd = new SqlCommand(assetQuery, sqlCon);
                        cmd.ExecuteNonQuery();
                    }
                }
                          }
        }
    }
}
