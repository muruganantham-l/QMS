using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Excel;
 
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using dts = Microsoft.SqlServer.Dts.Runtime;
 

using OfficeOpenXml
; using OfficeOpenXml.Table;

namespace AgingReport
{
    public partial class DownloadMasters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["name"] == null)
                {

                    Response.Redirect("~/loginPage.aspx");

                }
                else
                {
                    string username = Session["name"].ToString();
                    this.Label8.Text = string.Format("Hi {0}", Session["name"].ToString() + "!");
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }
        protected void ast_reg_btn_Click(object sender, EventArgs e)
        {

            SqlConnection con = null;

            try
                {

                //string constr = ConfigurationManager.ConnectionStrings["tomms_prodConnectionString"].ConnectionString;
                //using (SqlConnection con = new SqlConnection(constr))
                //{
                //    using (SqlCommand cmd = new SqlCommand("select_ast_master"))
                //    {


                //        //cmd.Parameters.Add("@master_type", SqlDbType.VarChar).Value = "asset";


                //        using (SqlDataAdapter sda = new SqlDataAdapter())
                //        {
                //            cmd.CommandType = CommandType.StoredProcedure;
                //            cmd.Connection = con;
                //            sda.SelectCommand = cmd;
                //            using (System.Data.DataTable dt = new System.Data.DataTable("Asset Register"))
                //            {
                //                sda.Fill(dt);

                //                 string outputPath = @"D:\test.xls";
                //                //string outputPath = @"\\172.30.30.238\MURUGANANTHAM\export_files\test.xls";

                //                if ((System.IO.File.Exists(outputPath)))
                //                {
                //                    System.IO.File.Delete(outputPath);
                //                }
                //                DataSet ds = new DataSet("AssetRegister");
                //                ds.Tables.Add(dt);
                //                ExportToExcel(ds, outputPath);
                //                //Execute_Package();

                //                Response.ContentType = "application / vnd.ms - excel";
                //                Response.AppendHeader("Content-Disposition", "attachment; filename= Asset Register " + DateTime.Now.ToString() + ".xls");


                //                Response.TransmitFile(outputPath);
                //                Response.End();

                //            }
                //        }
                //    }
                //}
                string constr = ConfigurationManager.ConnectionStrings["tomms_prodConnectionString"].ConnectionString;
                con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("select_ast_master");
                SqlDataAdapter sda = new SqlDataAdapter();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                System.Data.DataTable dt = new System.Data.DataTable("Asset Register");
                sda.Fill(dt);
                DataSet ds = new DataSet("AssetRegister");
                ds.Tables.Add(dt);
                GridView1.DataSource = ds;
                GridView1.DataBind();

               
                string outputPath = @"D:\test.xls";
                if ((System.IO.File.Exists(outputPath)))
                {
                    System.IO.File.Delete(outputPath);
                }

                //System.Data.DataTable employeeTable = new System.Data.DataTable("Asset Register");
                //employeeTable.Columns.Add("Employee ID");
                //employeeTable.Columns.Add("Employee Name");
                //employeeTable.Rows.Add("1", "ABC");
                //employeeTable.Rows.Add("2", "DEF");
                //employeeTable.Rows.Add("3", "PQR");
                //employeeTable.Rows.Add("4", "XYZ");
                //employeeTable.Rows.Add("5", null);

                //DataSet ds = new DataSet("AssetRegister");
                //ds.Tables.Add(employeeTable);
                //ExportToExcel(ds, outputPath);

                //Response.ContentType = "application / vnd.ms - excel";
                //Response.AppendHeader("Content-Disposition", "attachment; filename= Asset Register " + DateTime.Now.ToString() + ".xls");
                //Response.TransmitFile(outputPath);
                //Response.End();

                //DataSet ds = CreateSampleData();
                //CreateExcelFile.CreateExcelDocument(ds, "D:\\Sample.xlsx");
                //CreateExcelFile.CreateExcelDocument(employeeTable, "Sample.xlsx", Response);


            }
            catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            //finally
            //{
            //    con.Close();
            //    //  con1.Close();
            //}


        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Vithal" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }
        public static   void Execute_Package()
        {
            string pkgLocation = @"D:\Package.dtsx";

            dts.Package pkg;
            dts.Application app;
            dts.DTSExecResult pkgResults;
            //dts.Variables vars;
           
            app = new dts.Application();
            pkg = app.LoadPackage(pkgLocation, null);

            //vars = pkg.Variables;
            //vars["A_Variable"].Value = "Some value";

            //pkgResults = pkg.Execute(null, vars, null, null, null);
            //pkgResults = pkg.Execute();
            pkgResults = pkg.Execute(null, null, null, null, null);
           
            //if (pkgResults == dts.DTSExecResult.Success)
            //    this.StatusLabel.Text = "Package ran successfully"


            //    Console.WriteLine("Package ran successfully");
            //else
            //    Console.WriteLine("Package failed");
        }

        

        public static void ExportToExcel(DataSet dataSet, string outputPath)
        {
            // Create the Excel Application object
            ApplicationClass excelApp = new ApplicationClass();

            // Create a new Excel Workbook
            Workbook excelWorkbook = excelApp.Workbooks.Add(Type.Missing);

            int sheetIndex = 0;

            // Copy each DataTable
            foreach (System.Data.DataTable dt in dataSet.Tables)
            {

                // Copy the DataTable to an object array
                object[,] rawData = new object[dt.Rows.Count + 1, dt.Columns.Count];

                // Copy the column names to the first row of the object array
                for (int col = 0; col < dt.Columns.Count; col++)
                {
                    rawData[0, col] = dt.Columns[col].ColumnName;
                }

                // Copy the values to the object array
                for (int col = 0; col < dt.Columns.Count; col++)
                {
                    for (int row = 0; row < dt.Rows.Count; row++)
                    {
                        rawData[row + 1, col] = dt.Rows[row].ItemArray[col];
                    }
                }

                // Calculate the final column letter
                string finalColLetter = string.Empty;
                string colCharset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                int colCharsetLen = colCharset.Length;

                if (dt.Columns.Count > colCharsetLen)
                {
                    finalColLetter = colCharset.Substring(
                        (dt.Columns.Count - 1) / colCharsetLen - 1, 1);
                }

                finalColLetter += colCharset.Substring(
                        (dt.Columns.Count - 1) % colCharsetLen, 1);

                // Create a new Sheet
                Worksheet excelSheet = (Worksheet)excelWorkbook.Sheets.Add(
                    excelWorkbook.Sheets.get_Item(++sheetIndex),
                    Type.Missing, 1, XlSheetType.xlWorksheet);

                excelSheet.Name = dt.TableName;

                // Fast data export to Excel
                string excelRange = string.Format("A1:{0}{1}",
                    finalColLetter, dt.Rows.Count + 1);

                excelSheet.get_Range(excelRange, Type.Missing).Value2 = rawData;

                // Mark the first row as BOLD
                ((Range)excelSheet.Rows[1, Type.Missing]).Font.Bold = true;
            }

            // Save and Close the Workbook
            excelWorkbook.SaveAs(outputPath, XlFileFormat.xlWorkbookNormal, Type.Missing,
                Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlExclusive,
                Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            excelWorkbook.Close(true, Type.Missing, Type.Missing);
            excelWorkbook = null;

            // Release the Application object
            excelApp.Quit();
            excelApp = null;

            // Collect the unreferenced objects
            GC.Collect();
            GC.WaitForPendingFinalizers();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ExportGridToExcel();
            Response.Clear();
            Response.Charset = "";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=GridData.xlsx");

            System.Data.DataTable dt = GridView1.DataSource as System.Data.DataTable;
            using (ExcelPackage pck = new ExcelPackage())
       {
                ExcelWorksheet wsDt = pck.Workbook.Worksheets.Add("Sheet1");
                //wsDt.Cells("A1").LoadFromDataTable(dt, True, TableStyles.None);
                //wsDt.Cells(wsDt.Dimension.Address).AutoFitColumns();

                Response.BinaryWrite(pck.GetAsByteArray());
            }

            Response.Flush();
            Response.End();

        }
    }
}