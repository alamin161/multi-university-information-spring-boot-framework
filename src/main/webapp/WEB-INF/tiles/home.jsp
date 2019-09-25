<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
  <head>
   <%--<script type="application/ld+json">

        </script>--%>
  </head>
  <body>
<main class="content">

          <%--<div class="clearfix">
              <form class="form-inline float-right mt--1 d-none d-md-flex">
                  <button class="btn btn-primary"><i class="align-middle" data-feather="plus"></i> New project</button>
              </form>
              <h1 class="h3 mb-3">Dashboard</h1>
          </div>--%>


          <div class="row">
              <div class="col-md-8">
          <div class="slider">
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                      <div class="carousel-item active">
                          <img   src="/img/diu-1.png" alt="First slide" style="width: 800px;height: 400px;">
                      </div>
                      <div class="carousel-item">
                          <img   src="/img/diu-2.png" alt="Second slide" style="width: 800px;height: 400px;">
                      </div>
                      <div class="carousel-item">
                          <img <%--class="d-block w-100"--%> src="/img/diu-3.png" alt="Third slide" style="width: 800px;height: 400px;">
                      </div>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                  </a>
              </div>
          </div>
          </div>


              <div class="col-md-4" <%--class="col-12 col-md-6 col-xl-4 d-flex order-2 order-xl-1"--%>>

                  <div class="card flex-fill">
                      <div class="card-header">
                          <h5 class="card-title mb-0">Calendar</h5>
                      </div>
                      <div class="card-body d-flex">
                          <div class="align-self-center w-100">
                              <div class="chart">
                                  <div id="datetimepicker-dashboard"></div>
                              </div>
                          </div>
                      </div>
                  </div>

                  <script>
                      document.addEventListener("DOMContentLoaded", function(event) {
                          $('#datetimepicker-dashboard').datetimepicker({
                              inline: true,
                              sideBySide: false,
                              format: 'L'
                          });
                      });
                  </script>
              </div>

          </div>
</main>

  <main class="content">
      <div class="container-fluid p-0">
          <div class="row" style="background-color: #0d8ddc;padding: 5px;">
              <div  class="col-md-3">
              <%--<a style=" border-radius: 5px; font-weight: bolder;text-align: center; " class="active nav-link "   href="#">Convocation</a>--%>
                  <a href="${pageContext.request.contextPath}/all-university-admission-information">
                      <button class="btn btn-success" style="font-weight: bolder;text-align: center;border-radius: 5px;color: whitesmoke;"><i class="align-middle mr-2 fas fa-fw fa-th-large"></i>Admission News</button>
                  </a>
              </div>
              <div  class="col-md-3">
                  <a href="${pageContext.request.contextPath}/all-university-notice-board">
                      <button class="btn btn-success" style="font-weight: bolder;text-align: center;border-radius: 5px;color: whitesmoke;"><i class="align-middle mr-2 fas fa-fw fa-th"></i>Notice Board</button>
                  </a>
              </div>
              <div  class="col-md-3">
                  <a href="${pageContext.request.contextPath}/all-university-event-information">
                      <button class="btn btn-success" style="font-weight: bolder;text-align: center;border-radius: 5px;color: whitesmoke;"><i class="align-middle mr-2 fas fa-fw fa-th-large"></i>Events</button>
                  </a>
              </div>
              <div  class="col-md-3">
                  <a href="${pageContext.request.contextPath}/all-university-convocation-information">
                      <button class="btn btn-success" style="font-weight: bolder;text-align: center;border-radius: 5px;color: whitesmoke;"><i class="align-middle mr-2 fas fa-fw fa-medal"></i>Convocation</button>
                  </a>
              </div>

          </div><%--Button div end here--%>

          <%--pie chert start here--%>
          <div style="height: 3px;background-color: #395f9e;margin-top: 5px;"></div>
          <div class="row">
              <div class="col-12 col-md-6 col-xl-4 d-flex order-1 order-xl-2" style="margin-top: 10px;">
                  <div class="card flex-fill w-100">
                      <div class="card-header" style="background-color: #ffc2cc">
                          <h5 class="card-title mb-0"style="text-align: center;font-weight: bolder" >Research</h5>
                      </div>
                      <div class="card-body d-flex">
                          <div class="align-self-center w-100">
                              <div class="py-3">
                                  <div class="chart chart-sm">
                                      <canvas id="chartjs-dashboard-pie"></canvas>
                                  </div>
                              </div>

                              <table class="table mb-0">
                                  <tbody>
                                  <tr>
                                      <td><i class="fas fa-square-full text-primary"></i> Private University</td>
                                      <td class="text-right">2602</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-warning"></i> Public University</td>
                                      <td class="text-right">1253</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-danger"></i> Engineering University</td>
                                      <td class="text-right">541</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-info " ></i> Private Medical College</td>
                                      <td class="text-right">1465</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-success"  ></i> Public Medical College</td>
                                      <td class="text-right">987</td>
                                  </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>

                  <script>
                      document.addEventListener("DOMContentLoaded", function(event) {
                          // Pie chart
                          new Chart(document.getElementById("chartjs-dashboard-pie"), {
                              type: 'pie',
                              data: {
                                  labels: ["Private University", "Public University", "Engineering University", "Private Medical College","Public Medical College"],
                                  datasets: [{
                                      data: [2602, 1253, 541, 1465,987],
                                      backgroundColor: ["#0cc2aa", "#fcc100", "#f44455", "#5072D2","#25DA56"],
                                      borderColor: "transparent"
                                  }]
                              },
                              options: {
                                  responsive: !window.MSInputMethodContext,
                                  maintainAspectRatio: false,
                                  legend: {
                                      display: false
                                  }
                              }
                          });
                      });
                  </script>
              </div> <%--End research pie chart div here--%>

              <%--Start university reasear pie chaert here--%>
              <div class="col-12 col-md-6 col-xl-4 d-flex order-1 order-xl-2" style="margin-top: 10px;">
                  <div class="card flex-fill w-100">
                      <div class="card-header" style="background-color: #eef4a6">
                          <h5 class="card-title mb-0" style="text-align: center;font-weight: bolder">University</h5>
                      </div>
                      <div class="card-body d-flex">
                          <div class="align-self-center w-100">
                              <div class="py-3">
                                  <div class="chart chart-sm">
                                      <canvas id="chartjs-dashboard-pie2"></canvas>
                                  </div>
                              </div>

                              <table class="table mb-0">
                                  <tbody>
                                  <tr>
                                      <td><i class="fas fa-square-full text-success"></i> Private University</td>
                                      <td class="text-right">2602</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-info"></i> Public University</td>
                                      <td class="text-right">1253</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-danger"></i> Engineering University</td>
                                      <td class="text-right">541</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-warning" ></i> Public Medical College</td>
                                      <td class="text-right">1465</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-primary" ></i> Private Medical College</td>
                                      <td class="text-right">987</td>
                                  </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>

                  <script>
                      document.addEventListener("DOMContentLoaded", function(event) {
                          // Pie chart
                          new Chart(document.getElementById("chartjs-dashboard-pie2"), {
                              type: 'pie',
                              data: {
                                  labels: ["Private University", "Public University", "Engineering University", "Public Medical College","Private Medical College"],
                                  datasets: [{
                                      data: [2602, 1253, 541, 1465,987],
                                      backgroundColor: ["#25DA56", "#5072D2", "#f44455", "#fcc100","#0cc2aa"],
                                      borderColor: "transparent"
                                  }]
                              },
                              options: {
                                  responsive: !window.MSInputMethodContext,
                                  maintainAspectRatio: false,
                                  legend: {
                                      display: false
                                  }
                              }
                          });
                      });
                  </script>
              </div> <%--End university pie chart div here--%>

              <%--Start teacher pie chart here--%>
              <div class="col-12 col-md-6 col-xl-4 d-flex order-1 order-xl-2" style="margin-top: 10px;">
                  <div class="card flex-fill w-100">
                      <div class="card-header" style="background-color: #d698ff">
                          <h5 class="card-title mb-0"style="text-align: center;font-weight: bolder" >Teacher</h5>
                      </div>
                      <div class="card-body d-flex">
                          <div class="align-self-center w-100">
                              <div class="py-3">
                                  <div class="chart chart-sm">
                                      <canvas id="chartjs-dashboard-pie1"></canvas>
                                  </div>
                              </div>

                              <table class="table mb-0">
                                  <tbody>
                                  <tr>
                                      <td><i class="fas fa-square-full text-primary"></i> Private University</td>
                                      <td class="text-right">2602</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-warning"></i> Public University</td>
                                      <td class="text-right">1253</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-danger"></i> Engineering University</td>
                                      <td class="text-right">541</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-info " ></i> Private Medical College</td>
                                      <td class="text-right">1465</td>
                                  </tr>
                                  <tr>
                                      <td><i class="fas fa-square-full text-success"  ></i> Public Medical College</td>
                                      <td class="text-right">987</td>
                                  </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>

                  <script>
                      document.addEventListener("DOMContentLoaded", function(event) {
                          // Pie chart
                          new Chart(document.getElementById("chartjs-dashboard-pie1"), {
                              type: 'pie',
                              data: {
                                  labels: ["Private University", "Public University", "Engineering University", "Private Medical College","Public Medical College"],
                                  datasets: [{
                                      data: [2602, 1253, 541, 1465,987],
                                      backgroundColor: ["#0cc2aa", "#fcc100", "#f44455", "#5072D2","#25DA56"],
                                      borderColor: "transparent"
                                  }]
                              },
                              options: {
                                  responsive: !window.MSInputMethodContext,
                                  maintainAspectRatio: false,
                                  legend: {
                                      display: false
                                  }
                              }
                          });
                      });
                  </script>
              </div> <%--End teacher pie chart div here--%>

          </div><%--End row div here--%>
          <div style="height: 3px;background-color: #395f9e;margin-top: 5px;"></div>

      </div>
  </main>
  </body>
</html>

