<%@ Page Title="Live Scores" Language="C#" MasterPageFile="~/Iframe.Master" AutoEventWireup="true" CodeBehind="iframe.aspx.cs" Inherits="Crick_Scores.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


      <%

          long i = 1;

          foreach (byte b in Guid.NewGuid().ToByteArray())
          {
              i *= ((int)b + 1);
          }

          string number = String.Format("{0:d9}", (DateTime.Now.Ticks / 10) % 1000000000);

          string matchid = Request.QueryString["id"].ToString();


          System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
          System.Net.WebClient wc = new System.Net.WebClient();
          wc.Headers.Add("apikey", "FtFQ4cpD56RFXhJNHuR1RgWPICG3");

          dynamic cricketMatches = Page.Cache.Get(number);
          if(cricketMatches == null) {
              cricketMatches = serializer.DeserializeObject(wc.DownloadString("https://cricapi.com/api/cricketScore?apikey=FtFQ4cpD56RFXhJNHuR1RgWPICG3&unique_id="+matchid));
              Page.Cache.Add(number, cricketMatches, null, DateTime.Now.AddMinutes(3), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);
          }
          DateTime dateTime = DateTime.Now;
          int flag=1;
          string result;

          try {
              result = cricketMatches["score"];
          } catch (Exception ex) {
              flag = 0;
          }
         
%>

      <div class="card text-center">
  <div class="card-body">
      <h5 class="text-danger"><%=dateTime.ToString("dddd, dd MMMM yyyy - h:mm:ss tt") %></h5>
    
      <h4 class="text-info"><%=cricketMatches["team-1"] %> vs <%=cricketMatches["team-2"] %></h4>
   <% if (flag == 1)
       {
           %>
      <h3 class="text-primary"><%=cricketMatches["score"] %></h3>
      
      <%
    }
    else
    {
          %>
          <h4 class="text-primary">Match Cancelled</h4>

      <% } %>


              
  </div>
</div>

</asp:Content>
