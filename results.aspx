<%@ Page Title="Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="results.aspx.cs" Inherits="Crick_Scores.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header class="header header--bg">
      <div class="container">
               

    <div class="row">
          <div class="col-lg-5">
            <img class="img-responsive" src="../test_player.svg" alt="">
          </div>
          <div class="col-lg-7 header__content text-center">

            <h6 class="title">Results<span class="title-style"></span></h6>

              <%

	System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
    System.Net.WebClient wc = new System.Net.WebClient();
    wc.Headers.Add("apikey", "FtFQ4cpD56RFXhJNHuR1RgWPICG3");

    dynamic cricketMatches = Page.Cache.Get("matches2");
    if(cricketMatches == null) {
        cricketMatches = serializer.DeserializeObject(wc.DownloadString("http://cricapi.com/api/cricket/?rnd=" + DateTime.Now.Ticks));
        Page.Cache.Add("matches2", cricketMatches, null, DateTime.Now.AddMinutes(3), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);
    }

    foreach(var oo in cricketMatches["data"]) { 
%>
	
<div class="card bg-info">
  <div class="card-body">
    <h5 class="text-danger">Match ID - <%=oo["unique_id"] %></h5>

    <h3 class="text-primary"><%=oo["title"] %></h3>
  
          
  </div>
</div>

   <% 

           
       } 
       %> 


          </div>
        </div>
      </div>
    </header>

</asp:Content>
