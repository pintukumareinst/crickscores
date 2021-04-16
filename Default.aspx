<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Crick_Scores._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="content-wrapper" />
    <header class="header header--bg">
      <div class="container">
               

    <div class="row">
          <div class="col-lg-6">
            <img class="img-responsive" src="bot_player_banner.svg" alt="">
          </div>
          <div class="col-lg-6 header__content">
            <h1 class="title">Live Scores & Results Matches<span class="title-style"></span></h1>
            <p>Enjoy Live Score for International and Local Matches, also get upcoming live matches calender and much more..</p>
            <a class="header__button" href="live">Live Scores</a>
            <a class="header__button" href="calendar">Calendar</a>
          </div>
        </div>
      </div>
    </header>

    <section class="steps">
      <div class="container">
        <div class="page-section text-center">
          <h2 class="page-section__title">Services</h2>
          <div class="page-section__title-style">
            <span class="first-line"></span>
            <span class="second-line"></span>
          </div>
          <p class="page-section__subtitle">Enjoy Live Score for International and Local Matches, also get upcoming live matches calender and much more..</p>


          <div class="row">
            <div class="col-md-1">
            </div>

            <div class="col-md-3">
              <a href="results">
              <div class="text-center steps__single steps__single-first">
                
                <img src="assets/images/step1.png" alt="">
                <p>Results</p>
                <a class="button" href="results">Results</a>

              </div>
              </a>

            </div>
            <div class="col-md-4">
              <a href="live">
              <div class="text-center steps__single">
                <img src="assets/images/step2.png" alt="">
                <p>Live Scores</p>
                <a class="button" href="live">Live Scores</a>

              </div>
            </a>
            </div>
            <div class="col-md-3">
              <a href="calendar">
              <div class="text-center steps__single steps__single-last">
                <img src="assets/images/step3.png" alt="">
                <p>Match Calendar</p>
                <a class="button" href="calendar">Calendar</a>
              </div>
            </a>
            </div>
            
          </div>

         
        </div>
      </div>
    </section>

    <section class="video video--bg">
      <div class="container">
        <div class="page-section">
          <div class="row">
            <div class="col-md-7">

              <iframe width="100%" height="450px" src="https://www.youtube.com/embed/amMJfaB5dXo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              <!-- <div class="video__left">
                <a data-toggle="modal" data-target="#myModal" href="#"><i class="material-icons">play_circle_filled</i></a>
              </div> -->
              
            </div>
            <div class="col-md-5">
              <div class="video__right text-center">
                <h2 class="video__title">Watch Video</h2>
                <div class="video__title-style">
                  <span class="first-line"></span>
                  <span class="second-line"></span>
                </div>
                <p>Enjoy Live Score for International and Local Matches, also get upcoming live matches calender and much more..</p>
                <a class="button button--white" href="#">Watch Videos</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  

    <section class="team team--bg">
      <div class="container">
        <div class="page-section">
          <div class="text-center">
            <h2 class="page-section__title">Our team</h2>
            <div class="team__title-style">
              <span class="first-line"></span>
              <span class="second-line"></span>
            </div>
            <p class="page-section__subtitle">Enjoy Live Score for International and Local Matches, also get upcoming live matches calender and much more..</p>
          </div>
          <div class="row gutters-80">

                <div class="col-md-4">
                    </div>
            <div class="col-md-4">
              <div class="thumbnail team__single">
                <div class="bio text-center">
                  <img src="assets/images/team1.png" alt="">
                  <h2>Pintu Kumar, India</h2>
                  <p>Full Stack Developer</p>
                </div>
                <div class="caption">
                  <p>Enjoy Live Score for International and Local Matches, also get upcoming live matches calender and much more..</p>
                  <div class="social-icons">
                      <center>
                    <li><a href="#"><i class="flaticon-facebook-letter-logo"></i></a></li>
                    <li><a href="#"><i class="flaticon-twitter-logo-silhouette"></i></a></li>
                          </center>
                 
                  </div>
                </div>
              </div>
            </div>
          
          
         

          </div>
        </div>
      </div>
    </section>


    </div>

</asp:Content>
