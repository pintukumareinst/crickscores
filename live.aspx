<%@ Page Title="Live Scores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="live.aspx.cs" Inherits="Crick_Scores.Contact" %>

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
                  int j;
                
                  for (j=0;j<5;j++)
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

               vs_link = "score?matchid="+cricketMatches["matches"][j]["unique_id"];


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
    
    %>

<nav aria-label="Page navigation example" class="">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a runat="server" class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item active"><a runat="server" class="page-link" href="#">1</a></li>
    <li class="page-item"><a runat="server" class="page-link" href="~/live-page?id=2">2</a></li>
    <li class="page-item"><a runat="server" class="page-link" href="~/live-page?id=3">3</a></li>
    <li class="page-item">
      <a runat="server" class="page-link" href="~/live-page?id=2" aria-label="Next">
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
