using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Range : System.Web.UI.Page
{
    ArrayList arr = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        
        string str = "";
        txtFrom.Text = "0." + txtFrom.Text;
        txtTo.Text = "0." + txtTo.Text;
        str = txtFrom.Text + "-" + txtTo.Text;
        arr.Add(str);
        fill();
        txtFrom.Text = "";
        txtTo.Text = "";
    }
    public void fill()
    {
        foreach (var item in arr)
        {
            txtResult.Text += item.ToString(); 
        }
    }
}