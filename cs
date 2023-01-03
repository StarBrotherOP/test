using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.NetworkInformation;
using System.Text;
using System.Web.UI.HtmlControls;

namespace TestWeb1
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected  async void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    System.Data.DataRowView DRV = (System.Data.DataRowView)e.Item.DataItem;

                    var pingitems = (string)DRV.Row.ItemArray[1];



                    //參考官方Ping方式
                    Ping ping = new Ping();
                    string data = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
                    byte[] buffer = Encoding.ASCII.GetBytes(data);
                    PingOptions options = new PingOptions(64, true);

                    // Wait 1 seconds for a reply.
                    int timeout = 1000;

                    PingReply pingReply = await ping.SendPingAsync(pingitems, timeout, buffer, options);

                    
                    var lab = e.Item.FindControl("color") as HtmlControl;//找到html定義顏色群組

                    if (pingReply.Status != IPStatus.Success)
                    {
                        
                        

                        lab.Attributes.Add("class", "red");
                    }
                    else
                    {
                        SortDirection direction = SortDirection.Ascending;

                        pingitems = direction == SortDirection.Ascending ? pingitems : "";

                        lab.Attributes.Add("class", "mediumseagreen");
                    }
                
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>alert(\"" + "錯誤訊息 : " + ex.Message.Replace("\r\n", "") + "\");</script>");
            }

        }
    }
}
