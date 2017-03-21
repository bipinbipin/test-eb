<% /** Contributors:   Tony Morano  */%>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
<%@include file="../includes/sidenav.jsp" %>

<script src="/static/js/approval.js"></script>

<!-- MAIN PANEL -->
<div id="main" role="main">
    <%@include file="../includes/ribbon.jsp" %>
    <!-- MAIN CONTENT -->
    <div id="content">
        <!--
            The ID "widget-grid" will start to initialize all widgets below
            You do not need to use widgets if you dont want to. Simply remove
            the <section></section> and you can use wells or panels instead
            -->
        <!-- widget grid -->
        <section id="widget-grid" class="">
            <!-- row -->
            <div class="row">
                <!-- NEW WIDGET START -->
                <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget" id="wid-id-0">
                        <!-- widget options:
                            usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">
                            data-widget-colorbutton="false"
                            data-widget-editbutton="false"
                            data-widget-togglebutton="false"
                            data-widget-deletebutton="false"
                            data-widget-fullscreenbutton="false"
                            data-widget-custombutton="false"
                            data-widget-collapsed="true"
                            data-widget-sortable="false"
                        -->
                        <header>
                            <span class="widget-icon"> <i class="fa fa-comments"></i> </span>
                            <h2>Widget Title </h2>
                        </header>
                        <!-- widget div-->
                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox">
                                <!-- This area used as dropdown edit box -->
                                <input class="form-control" type="text">
                            </div>
                            <!-- end widget edit box -->
                            <!-- widget content -->
                            <div class="widget-body standard-widget">
                                <!-- this is what the user will see -->
                                <div class="row">
                                    <div class="col-md-10">
                                        <h1>Timecard Week: <span id="week"></span></h1>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-10">
                                        <h1>Engineer Name: <strong id="engineer-name"></strong></h1>
                                    </div>

                                    <div class="col-xs-2">
                                        <a class="btn btn-success btn-approval-size" onclick="saveApproval(true)">Approve</a>
                                        <a class="btn btn-danger btn-approval-size" onclick="saveApproval(false)">Deny</a>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-9">
                                        <h3 class="no-bottom-spacing">Billable Time: <span id="billable-time"></span></h3>
                                        <h3 class="no-top-bottom-spacing">Billable Overtime: <span id="billable-overtime"></span></h3>

                                        <h3 id="no-pto">PTO: Not Eligible</h3>

                                        <h3 class="no-bottom-spacing has-pto">PTO Used: <span id="pto-used"></span></h3>
                                        <h3 class="no-top-bottom-spacing has-pto">PTO Remaining: <span id="pto-remaining"></span></h3>
                                        <h3 class="no-top-spacing has-pto">PTO Accrued Upon Approval: <span id="pto-accrual"></span></h3>
                                    </div>

                                    <div class="col-md-3">
                                        <form class="smart-form">
                                        <fieldset>
                                            <label class="toggle" id="is-on-time">
                                                <input type="checkbox" name="checkbox-toggle">
                                                <i data-swchon-text="YES" data-swchoff-text="NO"></i>Timecard Is On Time:
                                            </label>
                                        </fieldset>
                                        </form>
                                    </div>
                                </div>

                                <div class="row big-space-bottom">

                                </div>

                                <!-- BEGIN NOTES -->
                                <!-- hidden unless notes approval.js#getOnTimeCard -->
                                <div class="row note-style"><hr /></div>

                                <div class="row">
                                    <div class="col-xs-3 text-align-right" id="notes-label"><h3> NOTES: </h3></div>
                                    <div id="notes" class="col-xs-6"></div>
                                    <div class="col-xs-3"></div>
                                </div>

                                <div class="row note-style"><hr /></div>

                                <!-- END NOTES -->

                                <div class="row big-space-bottom">

                                </div>

                                <!-- BEGIN DATE AND HOURS TABLE -->
                                <!-- changes to input on edit button click -->
                                <div class="row justify-content-md-center">
                                    <div class="col-md-1"></div>
                                    <div class="col-md-10">
                                        <table class="table table-striped table-hover">
                                            <thead></thead>

                                            <tbody>
                                                <tr>
                                                    <td class="width-100"></td>
                                                    <td><h1 id="date-0"></h1></td>
                                                    <td><h1 id="date-1"></h1></td>
                                                    <td><h1 id="date-2"></h1></td>
                                                    <td><h1 id="date-3"></h1></td>
                                                    <td><h1 id="date-4"></h1></td>
                                                    <td><h1 id="date-5"></h1></td>
                                                    <td><h1 id="date-6"></h1></td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td><h1 id="hour-0" class="hours"></h1></td>
                                                    <td><h1 id="hour-1" class="hours"></h1></td>
                                                    <td><h1 id="hour-2" class="hours"></h1></td>
                                                    <td><h1 id="hour-3" class="hours"></h1></td>
                                                    <td><h1 id="hour-4" class="hours"></h1></td>
                                                    <td><h1 id="hour-5" class="hours"></h1></td>
                                                    <td><h1 id="hour-6" class="hours"></h1></td>

                                                    <!-- approval.js#adminEditHours -> changes to save button approval.js#adminSaveHours -->
                                                    <td id="edit-save"><button class="btn btn-info btn-edit-save" onclick="adminEditHours()"><i class="fa fa-edit" />&nbsp;&nbsp;&nbsp;Edit</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-1"></div>
                                </div>

                                <!-- END DATE AND HOURS TABLE -->

                                <div id="screen-shots" class="text-align-center"></div>



                            </div>
                            <!-- end widget content -->
                        </div>
                        <!-- end widget div -->
                    </div>
                    <!-- end widget -->
                </article>
                <!-- WIDGET END -->
            </div>
            <!-- end row -->
            <!-- row -->
            <div class="row">
                <!-- a blank row to get started -->
                <div class="col-sm-12">
                    <!-- your contents here -->
                </div>
            </div>
            <!-- end row -->
        </section>
        <!-- end widget grid -->
    </div>
    <!-- END MAIN CONTENT -->
</div>
<!-- END MAIN PANEL -->
<%@include file="../includes/footer.jsp" %>
<%@include file="../sub_includes/shortcut_icons.jsp" %>
<!--================================================== -->
<%@include file="../sub_includes/commonScripts.jsp" %>
<!-- PAGE RELATED PLUGIN(S)
<script src="..."></script>-->

<script type="text/javascript">
    $(document).ready(function () {

        //  bundles all the functions from approval.js
        buildApprovalPage();

        /* DO NOT REMOVE : GLOBAL FUNCTIONS!
         *
         * pageSetUp(); WILL CALL THE FOLLOWING FUNCTIONS
         *
         * // activate tooltips
         * $("[rel=tooltip]").tooltip();
         *
         * // activate popovers
         * $("[rel=popover]").popover();
         *
         * // activate popovers with hover states
         * $("[rel=popover-hover]").popover({ trigger: "hover" });
         *
         * // activate inline charts
         * runAllCharts();
         *
         * // setup widgets
         * setup_widgets_desktop();
         *
         * // run form elements
         * runAllForms();
         *
         ********************************
         *
         * pageSetUp() is needed whenever you load a page.
         * It initializes and checks for all basic elements of the page
         * and makes rendering easier.
         *
         */

        pageSetUp();

    });
    </script>
</body>
</html>