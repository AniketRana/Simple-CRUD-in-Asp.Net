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



public partial class test : System.Web.UI.Page
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
            FillCity();
            Display();

        }
    }
    public void FillCity()
    {
        con.Open();
        sql = "select City from tblCity";
        adp = new SqlDataAdapter(sql, con);
        dt = new DataTable();
        adp.Fill(dt);
        con.Close();
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "City";
        ddlCity.DataBind();
    }
    public void Display()
    {
        clear();
        pnlgrid.Visible = true;
        pnlForm.Visible = false;

        con.Open();
        sql = "select * from tbluser";
        adp= new SqlDataAdapter(sql,con);
        dt =new DataTable();
        adp.Fill(dt);
        con.Close();
        grvdata.DataSource = dt;
        grvdata.DataBind();
    }
    public void clear()
    {
        txtid.Text = "";
        txtEducation.Text = "";
        txtEmail.Text = "";
        txtName.Text = "";
        txtMob.Text = "";
        
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        clear();
        pnlForm.Visible = true;
        pnlgrid.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string gender = "";
        if (rbtmale.Checked == true)
        {
            gender = "1";
        }
        else
        {
            gender = "0";
        }   

        if (txtid.Text == "")
        {
            string path = Path.Combine(Server.MapPath("~/img"),
            Path.GetFileName(filepic.FileName));
            filepic.SaveAs(path);

            con.Open();
            sql = "insert into tbluser ([Name],[Email],[City],[MobileNo],[Education],[Photo],[Gender]) ";
            sql += " values ('"+txtName.Text+"','"+txtEmail.Text+"','"+ddlCity.SelectedItem+"','"+txtMob.Text+"','"+txtEducation.Text+"',";
            sql += " '" + filepic.FileName + "','" + gender + "')";
            cmd= new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Display();
        }
        else
        {
            //update
            if (filepic.FileName != "")
            {
                string path = Path.Combine(Server.MapPath("~/img"),
               Path.GetFileName(filepic.FileName));
                filepic.SaveAs(path);
                lblFName.Text = filepic.FileName;
            }

            con.Open();
            sql = "update tbluser set name = '" + txtName.Text + "', Email= '" +txtEmail.Text + "',";
            sql += "City = '" + ddlCity.SelectedValue + "', MobileNo = '" + txtMob.Text + "',";
            sql += "Education = '" + txtEducation.Text + "' , Photo = '" + lblFName.Text + "',";
            sql += "Gender = '"+gender+"' where ID = '"+txtid.Text+"'";
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Display();   
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
        pnlForm.Visible = false;
        pnlgrid.Visible = true;
    }
    protected void btnupd_Command(object sender, CommandEventArgs e)
    {
        pnlForm.Visible = true;
        pnlgrid.Visible = false;

        string id = e.CommandArgument.ToString();
        con.Open();
        sql = "select * from tbluser where ID = '"+id+"'";
        adp = new SqlDataAdapter(sql, con);
        dt = new DataTable();
        adp.Fill(dt);
        con.Close();

        txtid.Text = dt.Rows[0]["ID"].ToString();
        txtName.Text = dt.Rows[0]["Name"].ToString();
        txtEmail.Text = dt.Rows[0]["Email"].ToString();
        ddlCity.SelectedValue = dt.Rows[0]["City"].ToString();
        txtMob.Text = dt.Rows[0]["MobileNo"].ToString();
        txtEducation.Text = dt.Rows[0]["Education"].ToString();
        lblFName.Text = dt.Rows[0]["Photo"].ToString();
        if (dt.Rows[0]["Gender"].ToString() == "1")
        {
            rbtmale.Checked = true;
        }
        else
        {
            rbtfemale.Checked = true;
        }

    }
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandName.ToString();
        con.Open();
        sql = "delete from tbluser where Id = '" +id+"'";
        cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        con.Close();

        Display();
    }
  
}