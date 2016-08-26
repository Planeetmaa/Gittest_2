using System.IO;
using System;
using DatabaseGetXML.Suporrt;
using System.Data.SqlClient;

namespace DatabaseGetXML.EVKPDF
{
    public class EVKPDFImp
    {
        public static void MakeEVKPDFImp(string Main_LogFilePath, string Main_LogName)
        {
            using (System.IO.StreamWriter Logfile = new System.IO.StreamWriter(String.Format("{0}MakeEVKPDFImp_{1}", Main_LogFilePath, Main_LogName), true))
            {
                //DB._SQLCommand("Update dbo.LOG_TASK_TIME Set Last_RunTime = Getdate() Where RecordId = 38");
                SystemFunction.LogMessage("Make EVKPDFImport - START", Logfile);


                if (GeStepApproval("CreatePdfFile", Logfile))
                {
                    CreatePdfFile(Logfile);
                }
                else
                {
                    SystemFunction.LogMessage("CreatePdfFile / Blocked by Parameter - ... From MT_Parameeter Where Type = 'ACC_PDF'", Logfile);
                }

                SystemFunction.LogMessageEmptyLine(" - ", Logfile);
                SystemFunction.LogMessageEmptyLine(" - ", Logfile);

                /*
                if (GeStepApproval("SendOUTEMAIL", Logfile))
                {
                    SendOUTEMAIL(Logfile);
                }
                else
                {
                    SystemFunction.LogMessage("Make AccountInvoice - SendOUTEMAIL / Blocked by Parameter - ... From MT_Parameeter Where Type = 'ACC_INV'", Logfile);
                }
                */

                SystemFunction.LogMessageEmptyLine(" - ", Logfile);
                SystemFunction.LogMessageEmptyLine(" - ", Logfile);

                /*
                if (GeStepApproval("CreateReport", Logfile))
                {
                    CreateReport(Logfile);
                }
                else
                {
                    SystemFunction.LogMessage("Make AccountInvoice - CreateReport / Blocked by Parameter - ... From MT_Parameeter Where Type = 'ACC_INV'", Logfile);
                }
                */

                //DB._SQLCommand("Update dbo.LOG_TASK_TIME Set Last_EndTime = Getdate() Where RecordId = 38");
                SystemFunction.LogMessage("Make EVKPDFImport - END", Logfile);
            }
        }
        public static void CreatePdfFile(System.IO.StreamWriter Logfile)
        {
            //DB._SQLCommand("Update dbo.LOG_TASK_TIME Set Last_RunTime = Getdate() Where RecordId = 20");
            SystemFunction.LogMessage("CreatePdfFile - START", Logfile);

            //SystemFunction.LogMessage("SQL - Start - Exec Dbo.RM_KontoInvoice_Vahetasu_BlockInvoice", Logfile);
            //DB._SQLCommand("Exec dbo.RM_KontoInvoice_Vahetasu_BlockInvoice");
            //SystemFunction.LogMessage("SQL - End - Exec Dbo.RM_KontoInvoice_Vahetasu_BlockInvoice", Logfile);


            string rCount = GetRowCount("dbo.EVKPDF");
            int _counter = 0;

            SystemFunction.LogMessage(String.Format("CreatePdfFile - Loop ({0} count)- START", rCount), Logfile);

            using (SqlConnection con = DB.OpenConnection())
            {
                using (SqlCommand cmd = DB.GetCommand(con, "Select ID,LIIK,PDF From EVKPDF"))
                {
                    using (SqlDataReader rdr = DB.GetReader(cmd))
                    {
                        try
                        {
                            if (rdr.HasRows)
                            {
                                while (rdr.Read())
                                {
                                    _counter++;
                                    SystemFunction.LogMessage(string.Format("EVKPDF.ID = {0};LIIK = {1};PDF = {2}  [{3}/{4}] ", rdr[0].ToString().Trim(), rdr[1].ToString().Trim(), rdr[2].ToString().Trim(), _counter.ToString().Trim(), rCount.Trim()), Logfile);
                                }
                            }
                            else
                            {
                                SystemFunction.LogMessage("No EVKPDF rows found (Select ID,LIIK,PDF From EVKPDF)", Logfile);
                            }
                        }
                        catch (Exception ex)
                        {
                            SystemFunction.LogMessage(String.Format("SQL Error {0}{1}", ex.Message.Trim(), "On command >> Exec ?????"), Logfile);
                        }
                        finally
                        {
                            DB.CloseReader(rdr);
                        }
                    }
                }
                DB.CloseConnection(con);
            }

            SystemFunction.LogMessage(String.Format("CreatePdfFile - Loop - END", rCount), Logfile);

            //DB._SQLCommand("Update dbo.LOG_TASK_TIME Set Last_EndTime = Getdate() Where RecordId = 20");
            SystemFunction.LogMessage("CreatePdfFile - END", Logfile);
        }

        public static string GetRowCount(string TableName)
        {
            string result = "0";
            using (SqlConnection con = DB.OpenConnection())
            {
                using (SqlDataReader rdr = DB.GetReader(con, String.Format("Select Count(*) as rCount From {0}", TableName)))
                {
                    try
                    {
                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                result = rdr[0].ToString();
                            }
                        }
                    }
                    catch
                    {
                        return result;
                    }
                    DB.CloseReader(rdr);
                }
                DB.CloseConnection(con);
            }
            return result;
        }
        public static Boolean GeStepApproval(string name, System.IO.StreamWriter Logfile)
        {
            Boolean result = false;
            using (SqlConnection con = DB.OpenConnection())
            {
                using (SqlDataReader rdrGet = DB.GetReader(con, String.Format("Select Top 1 Rtrim(LTrim(Value_TXT)) From MT_Parameeter Where Type = 'ACC_PDF' And Name = '{0}'", name)))
                {
                    try
                    {
                        if (rdrGet.HasRows)
                        {
                            while (rdrGet.Read())
                            {
                                string sqlResult = rdrGet[0].ToString().Trim();
                                if (sqlResult == "YES")
                                {
                                    result = true;
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        SystemFunction.LogMessage(String.Format("Error {0}{1}", ex.Message.Trim(), "On Select * from MT_Parameeter >> ... "), Logfile);
                        return result;
                    }
                    DB.CloseReader(rdrGet);
                }
                DB.CloseConnection(con);
            }
            return result;
        }
    }
}
