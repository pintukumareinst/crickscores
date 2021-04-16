<%@ Page Title="Live Scores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="live-page.aspx.cs" Inherits="Crick_Scores.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <header class="header header--bg">
      <div class="container">
               

    <div class="row">
          <div class="col-lg-5">
            <img class="img-responsive" src="../test_player.svg" alt="">
          </div>
          <div class="col-lg-7 header__content text-center">

            <h6 class="title">International<span class="title-style"></span></h6>

              <%

                  System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                  System.Net.WebClient wc = new System.Net.WebClient();
                  wc.Headers.Add("apikey", "FtFQ4cpD56RFXhJNHuR1RgWPICG3");

                  dynamic cricketMatches = Page.Cache.Get("matches");
                  if(cricketMatches == null) {
                      cricketMatches = serializer.DeserializeObject(wc.DownloadString("http://cricapi.com/api/matches/?rnd=" + DateTime.Now.Ticks));
                      Page.Cache.Add("matches", cricketMatches, null, DateTime.Now.AddMinutes(3), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);
                  }

                  string vs_link = "";
                  var id = Request.QueryString["id"].ToString();

                  int loop=Int16.Parse(id);
                  int i=loop*5;

                  int l=i-5;
                  int u=i+5;
                  int j;

                  for (j=l;j<i;j++)
                  {
                      var dateString = cricketMatches["matches"][j]["dateTimeGMT"];
                      DateTime dateTime = DateTime.Parse(dateString);

%>
       
<div class="card bg-info">
  <div class="card-body">
    <h5 class="text-danger"><%= dateTime.ToString("dddd, dd MMMM yyyy - h:mm tt") %></h5>

    <h3 class="text-primary"><%= cricketMatches["matches"][j]["team-1"] %> vs <%= cricketMatches["matches"][j]["team-2"] %></h3>
   
        <%              if (cricketMatches["matches"][j]["matchStarted"] == true)
           {

               vs_link = "score?match="+cricketMatches["matches"][j]["unique_id"];

%>

    <a class="btn btn-primary btn-sm" href="<%= vs_link %>" role="button">View Score</a>
          
<% 

    }
    else
    {
        %>

      Match not started

<% 

    }
        %>

          
  </div>
</div>

<% 
    }
    string link_l;
    int page_l=loop-1;
    int page_u=loop+1;
    string link_u="live-page?id="+page_u;
    
    if (l == 5)
        link_l = "live";
    else
        link_l = "live-page?id="+page_l;

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
