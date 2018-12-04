using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class inline : System.Web.UI.Page
{

    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    SqlDataAdapter adp = new SqlDataAdapter();
    DataTable dt = new DataTable();
    string sql;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Display();
        }
    }
    public void Display()
    {
        con.Open();
        sql = "select * from tbluser";
        adp = new SqlDataAdapter(sql, con);
        dt = new DataTable();
        adp.Fill(dt);
        con.Close();
        grvdata.DataSource = dt;
        grvdata.DataBind();
    }
    //public void clear()
    //{
    //    txtid.Text = "";
    //    txtEducation.Text = "";
    //    txtEmail.Text = "";
    //    txtName.Text = "";
    //    txtMob.Text = "";

    //}
    public void FillCity()
    {
        con.Open();
        sql = "select City from tblCity";
        adp = new SqlDataAdapter(sql, con);
        dt = new DataTable();
        adp.Fill(dt);
        con.Close();
    }

    protected void grvdata_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox id = grvdata.Rows[e.RowIndex].FindControl("Gtxtid") as TextBox;
        TextBox Name = grvdata.Rows[e.RowIndex].FindControl("GtxtName") as TextBox;
        TextBox Email= grvdata.Rows[e.RowIndex].FindControl("GtxtEmail") as TextBox;
        DropDownList City= grvdata.Rows[e.RowIndex].FindControl("GddlCity") as DropDownList;        
        TextBox Mno = grvdata.Rows[e.RowIndex].FindControl("GtxtMno") as TextBox;
        TextBox Education = grvdata.Rows[e.RowIndex].FindControl("GtxtEducation") as TextBox;
        FileUpload newfile = grvdata.Rows[e.RowIndex].FindControl("nfileupd") as FileUpload;
        RadioButtonList rbtgen = grvdata.Rows[e.RowIndex].FindControl("rbtGender") as RadioButtonList;

        string nfile = "";
        if (newfile.FileName.Length != 0)
        {
            Image imgname = grvdata.Rows[e.RowIndex].FindControl("GimgPic") as Image;
            nfile = imgname.ImageUrl.Replace("img/", "");
        }
        else
        {
            nfile = newfile.FileName;
        }



        string gender = "1";
        if (rbtgen.Text == "Male")
        {
            gender = "1";
        }
        else
        {
            gender = "0";
        }


        con.Open();
        sql = "update tbluser set Name = '"+Name.Text+"',";
        sql += "Email = '"+Email.Text+"',";
        sql += "City = '" + City.SelectedItem.Text + "',";
        sql += "MobileNo = '" + Mno.Text + "',";
        sql += "Education = '" + Education.Text + "',";
        sql += "Photo = '" + nfile + "',";
        sql += "Gender = '" + gender + "' where ID = '"+id.Text+"'";

        cmd = new SqlCommand(sql, con);
        int cnt = cmd.ExecuteNonQuery();
        con.Close();
        if (cnt == 1)
        {
            Display();
        }

    }

    protected void grvdata_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvdata.EditIndex = e.NewEditIndex;
        Display();
    }

    protected void grvdata_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvdata.EditIndex = -1;
        Display();
    }

    public DataTable getCity()
    {
        con.Open();
        sql = "select City from tblCity";
        adp = new SqlDataAdapter(sql, con);
        dt = new DataTable();
        adp.Fill(dt);
        con.Close();
        return dt;
    }

    protected void grvdata_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //while add new record that time bind dropdownlist
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            DropDownList ddl = (DropDownList)e.Row.Cells[1].FindControl("NddlCity");
            ddl.Items.Clear();
            ddl.DataSource = getCity(); //set the datasource here
            ddl.DataTextField = "City";
            ddl.DataBind();
        }

        //For Radiobutton 
        DataRowView drv = e.Row.DataItem as DataRowView;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                RadioButtonList rbtnl = (RadioButtonList)e.Row.FindControl("RadioButtonList1");
                rbtnl.SelectedValue = drv[8].ToString();
                if (drv[8].ToString() == "0")
                {
                    rbtnl.SelectedValue = "Female";
                }
                else
                {
                    rbtnl.SelectedValue = "Male";
                }
            }
        }
         //For City
         if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddList = (DropDownList)e.Row.FindControl("GddlCity");
                
                ddList.DataSource = getCity();
                ddList.DataTextField = "City";
                ddList.DataBind();

                DataRowView dr = e.Row.DataItem as DataRowView;
                ddList.SelectedValue = dr["City"].ToString();

            }
        }
         

    }

    protected void grvdata_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            con.Open();
            sql = "Insert into tbluser ([Name],[Email],[City],[MobileNo],[Education],[Photo],[Gender]) VALUES (@Name,@Email,@City,@MobileNo,@Education,@Photo,@Gender)";
            cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Name", (grvdata.FooterRow.FindControl("ntxtName") as TextBox).Text.Trim());
            cmd.Parameters.AddWithValue("@Email", (grvdata.FooterRow.FindControl("ntxtEmail") as TextBox).Text.Trim());
            cmd.Parameters.AddWithValue("@City", (grvdata.FooterRow.FindControl("NddlCity") as DropDownList).SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@MobileNo", (grvdata.FooterRow.FindControl("ntxtMno") as TextBox).Text.Trim());
            cmd.Parameters.AddWithValue("@Education", (grvdata.FooterRow.FindControl("ntxtEducation") as TextBox).Text.Trim());
            cmd.Parameters.AddWithValue("@Photo", (grvdata.FooterRow.FindControl("nfileupd") as FileUpload).FileName.Trim());

            if ((grvdata.FooterRow.FindControl("rbtGender") as RadioButtonList).SelectedItem.ToString() == "Male")
            {
                cmd.Parameters.AddWithValue("@Gender", "1");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Gender", "0");
            }
            int cnt = cmd.ExecuteNonQuery();
            con.Close();
            if (cnt == 1)
            {
                Response.Redirect("inline.aspx");
            }
        }
    }

    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        con.Open();
        sql = "delete from tbluser where ID = '"+id+"'";
        cmd = new SqlCommand(sql, con);
        int cnt =cmd.ExecuteNonQuery();
        con.Close();
        if (cnt == 1)
        {
            Response.Redirect("inline.aspx");
        }
    }
}