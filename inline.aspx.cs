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
       // clear();
       // pnlgrid.Visible = true;
        //pnlForm.Visible = false;

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
        //ddlCity.DataSource = dt;
        //ddlCity.DataTextField = "City";
        //ddlCity.DataBind();
    }

    protected void grvdata_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox id = grvdata.Rows[e.RowIndex].FindControl("Gtxtid") as TextBox;
        TextBox Name = grvdata.Rows[e.RowIndex].FindControl("GtxtName") as TextBox;
        TextBox Email= grvdata.Rows[e.RowIndex].FindControl("GtxtEmail") as TextBox;

        DropDownList City= grvdata.Rows[e.RowIndex].FindControl("GddlCity") as DropDownList;

        TextBox Mno = grvdata.Rows[e.RowIndex].FindControl("GtxtMno") as TextBox;
        TextBox Education = grvdata.Rows[e.RowIndex].FindControl("GtxtEducation") as TextBox;

        //update query

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

    protected void grvdata_RowDataBound(object sender, GridViewRowEventArgs e)
    {
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
                    rbtnl.SelectedValue = "female";
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

                //return DataTable havinf department data
                con.Open();
                sql = "select City from tblCity";
                adp = new SqlDataAdapter(sql, con);
                dt = new DataTable();
                adp.Fill(dt);
                con.Close();

                ddList.DataSource = dt;
                ddList.DataTextField = "City";
                //ddList.DataValueField = "dp_Id";
                ddList.DataBind();

                DataRowView dr = e.Row.DataItem as DataRowView;
                ddList.SelectedValue = dr["City"].ToString();
            }
        }

    }
}