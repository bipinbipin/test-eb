<% /** Contributors:   ?    NOT SURE IF NEEDED  */%>

<!-- START HEAD -->
<%@include file="includes/header.jsp" %>
<!-- END HEAD -->
<!-- BEGIN NAVIGATION -->
<div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
    <%@include file="includes/navbar.jsp" %>
    <!-- END NAVIGATION -->

    <div id="hoeapp-container" hoe-color-type="lpanel-bg5" hoe-lpanel-effect="shrink">

        <!-- BEGIN SIDE NAVIGATION -->
        <%@include file="includes/sidenav.jsp" %>
        <!-- END SIDE NAVIGATION -->

        <!--BEGIN MAIN CONTENT -->
        <section id="main-content">
            <div class="space-30"></div>
            <div class="container">
                <!--widget box row-->
                <div class="row">
                    <div class="col-sm-6 col-md-3 margin-b-30">
                        <div class="statistic-widget-box bg-primary">
                            <i class="fa fa-calendar"></i>
                            <div class="content overflow-hidden">
                                <h1>450</h1>
                                <p>Total Hours</p>
                            </div>
                        </div><!--statistic box end-->
                    </div><!--col end-->
                    <div class="col-sm-6 col-md-3 margin-b-30">
                        <div class="statistic-widget-box bg-danger">
                            <i class="fa fa-usd"></i>
                            <div class="content overflow-hidden">
                                <h1>$250</h1>
                                <p>Quarterly Timecard Bonus</p>
                            </div>
                        </div><!--statistic box end-->
                    </div><!--col end-->
                    <div class="col-sm-6 col-md-3 margin-b-30">
                        <div class="statistic-widget-box bg-success">
                            <i class="fa fa-calendar-check-o"></i>
                            <div class="content overflow-hidden">
                                <h1>27</h1>
                                <p>PTO</p>
                            </div>
                        </div><!--statistic box end-->
                    </div><!--col end-->
                    <div class="col-sm-6 col-md-3 margin-b-30">
                        <div class="statistic-widget-box bg-info">
                            <i class="fa fa-calendar-plus-o"></i>
                            <div class="content overflow-hidden">
                                <h1>19</h1>
                                <p>Vacation</p>
                            </div>
                        </div><!--statistic box end-->
                    </div><!--col end-->
                </div>
                <!--widget box row-->
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel">
                            <header class="panel-heading">
                                <div class="panel-actions">
                                    <a class="panel-action panel-action-toggle" href="#" data-panel-toggle=""></a>
                                    <a class="panel-action panel-action-dismiss" href="#" data-panel-dismiss=""></a>
                                </div>
                                <h2 class="panel-title">Timecard Submissions</h2>

                            </header>
                            <div class="panel-body">
                                <div class="chartjs-data">
                                    <canvas width="741" height="370" id="lineChart" style="width: 593px; height: 296px;"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel">
                            <header class="panel-heading">
                                <div class="panel-actions">
                                    <a class="panel-action panel-action-toggle" href="#" data-panel-toggle=""></a>
                                    <a class="panel-action panel-action-dismiss" href="#" data-panel-dismiss=""></a>
                                </div>
                                <h2 class="panel-title">Yearly Hours </h2>

                            </header>
                            <div class="panel-body">
                                <div class="chartjs-data">
                                    <canvas width="741" height="370" id="doughnutChart" style="width: 593px; height: 296px;"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>
                </div><!--end row-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel">
                            <header class="panel-heading">
                                <div class="panel-actions">
                                    <a href="javascript:void(0)" class="panel-action panel-action-toggle"
                                       data-panel-toggle=""></a>
                                    <a href="javascript:void(0)" class="panel-action panel-action-dismiss"
                                       data-panel-dismiss=""></a>
                                    <div class="dropdown pull-left">
                                        <a href="" data-toggle="dropdown" class="dropdown-toggle"><i
                                                class="ion-more"></i></a>
                                        <ul class="dropdown-menu dropdown-menu-scale">
                                            <li><a href="javascript:void(0)">Action</a></li>
                                            <li><a href="javascript:void(0)">Just Action</a></li>
                                            <li><a href="javascript:void(0)">Action Now</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h2 class="panel-title">Recent Tickets</h2>
                            </header>
                            <div class="panel-body">
                                <div class="scrollDiv">
                                    <table class="table table-striped">
                                        <tbody>
                                        <tr>
                                            <th>
                                                <div>Status</div>
                                            </th>
                                            <th align="left">
                                                <div>Start Date</div>
                                            </th>
                                            <th align="left">
                                                <div>End Date</div>
                                            </th>
                                            <th align="center">
                                                <div>Notes</div>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="label label-warning">Pending</span>
                                            </td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td nowrap="" align="center">None</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td nowrap="" align="center">None</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="label label-danger">Late</span>
                                            </td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td nowrap="" align="center">None</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="label label-danger">Late</span>
                                            </td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td nowrap="" align="center">None</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="label label-success">Approved</span>
                                            </td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td align="left">MM/dd/YYYY</td>
                                            <td nowrap="" align="center">None</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div><!--end panel body-->
                        </div><!--end panel-->
                    </div><!--end col 6-->
                </div><!--end row-->
            </div><!--end container-->

            <!--footer start-->
            <div class="footer">
                <div class="row">
                    <div class="col-sm-12">
                        <span>&copy; Copyright 2017. Aston Technologies</span>
                    </div>
                </div>
            </div>
            <!--footer end-->
        </section><!--END MAIN CONTENT-->
    </div>
</div>
<!--end wrapper-->


<!-- BEGIN FOOTER -->
<%@include file="includes/footer.jsp" %>
<!-- END FOOTER -->

