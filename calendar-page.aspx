<%@ Page Title="Live Scores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="calendar-page.aspx.cs" Inherits="Crick_Scores.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="header header--bg">
      <div class="container">
               

    <div class="row">
          <div class="col-lg-5">
            <img class="img-responsive" src="../test_player.svg" alt="">
          </div>
          <div class="col-lg-7 header__content text-center">

            <h6 class="title">Calendar<span class="title-style"></span></h6>

              <%

                  System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                  System.Net.WebClient wc = new System.Net.WebClient();

                  wc.Headers.Add("apikey", "FtFQ4cpD56RFXhJNHuR1RgWPICG3");

                  dynamic cricketMatches = Page.Cache.Get("matchesC");
                  if(cricketMatches == null) {
                      cricketMatches = serializer.DeserializeObject(wc.DownloadString("http://cricapi.com/api/matchcalendar/?rnd=" + DateTime.Now.Ticks));
                      Page.Cache.Add("matchesC", cricketMatches, null, DateTime.Now.AddMinutes(3), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);
                  }

           

                  var id = Request.QueryString["id"].ToString();

                  int loop=Int16.Parse(id);
                  int i=loop*5;

                  int l=i-5;
                  int u=i+5;
                  int j;

                  for (j=l;j<i;j++)
                  {
                      var dateString = cricketMatches["data"][j]["date"];
                      DateTime dateTime = DateTime.Parse(dateString);

%>
       
<div class="card bg-info">
  <div class="card-body">
    <h5 class="text-danger"><%= dateTime.ToString("dddd, dd MMMM yyyy") %></h5>

    <h3 class="text-primary"><%= cricketMatches["data"][j]["name"] %></h3>
          
  </div>
</div>

<% 
    }
    string link_l;
    int page_l=loop-1;
    int page_u=loop+1;
    string link_u="calendar-page?id="+page_u;
    
    if (l == 5)
        link_l = "calendar";
    else
        link_l = "calendar-page?id="+page_l;

    %>

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="<%= link_l %>" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="<%= link_l %>"><%= page_l %></a></li>
    <li class="page-item active"><a class="page-link" href="#"><%= loop %></a></li>
    <li class="page-item"><a class="page-link" href="<%= link_u %>"><%= page_u %></a></li>
    <li class="page-item">
      <a class="page-link" href="<%= link_u %>" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

          </div>
        </div>
      </div>
    </header>

</asp:Content>
