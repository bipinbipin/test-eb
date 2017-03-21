<% /** Contributors:   Tony Morano, Eric Johnson, Josh Nickleby  */%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
<%@include file="../includes/sidenav.jsp" %>

<c:url value="../static/js/timecard.js" var="timecard" />

<script src="${timecard}" ></script>

<%--<script>--%>
    <%--$(document).ready(function() {--%>
        <%----%>
    <%--});--%>
<%--</script>--%>

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
                            <h2>Engineer Timecard</h2>
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
                            <div class="widget-body">
                                <!-- this is what the user will see -->
                                <div class="row">
                                    <form id="wizard-1" novalidate="novalidate">
                                        <div id="bootstrap-wizard-1" class="col-sm-12">
                                            <div class="form-bootstrapWizard">

                                                <!-- todo: figure out how to position this better -->

                                                <ul class="bootstrapWizard form-wizard">
                                                    <li class="active" data-target="#step1">
                                                        <a href="#tab1" data-toggle="tab"> <span class="step"> &nbsp; </span>
                                                            <span class="title">Work week</span> </a>
                                                    </li>
                                                    <li id="screenShot" data-target="#step2">
                                                        <a href="#tab2" data-toggle="tab"> <span class="step"> &nbsp;</span>
                                                            <span class="title">Screen shots</span> </a>
                                                    </li>
                                                    <li data-target="#step3">
                                                        <a href="#tab3" data-toggle="tab"> <span class="step"> &nbsp;</span>
                                                            <span class="title">Add Notes</span> </a>
                                                    </li>
                                                    <li data-target="#step4">
                                                        <a href="#tab4" data-toggle="tab"> <span class="step"> &nbsp;</span>
                                                            <span class="title">Submit</span> </a>
                                                    </li>

                                                </ul>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab1">
                                                    <div id="Hidden"></div>

                                                    <h2 class="text-center">Calculate the total number of hours you worked, round to the nearest quarter-hour</h2>

                                                    <label for="WeekSelect">
                                                        <p>Timecard for Week:</p>
                                                    </label>
                                                    <select id="WeekSelect" class="form-control">
                                                        <%-- information populated from timecard.js file--%>
                                                    </select>
                                                    <div class="row justify-content-md-center">
                                                        <div class="col-md-2"></div>
                                                        <div class="col-md-8">
                                                    <table id="TimecardTable" class="table table-striped table-hover">

                                                        <thead>

                                                        </thead>

                                                        <tbody>

                                                        <tr id="WorkDaysDates">
                                                            <%-- populated from buildTimecardTable --%>
                                                        </tr>

                                                        <tr id="WorkDays" class="form-group">
                                                            <%-- populated from buildTimecardTable --%>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                            </div>
                                                        </div>
                                                    <div class = "row">
                                                    <span id ="TotalPTO" class="col-md-5"></span>
                                                    <span id="TotalWeeklyHours" class="col-md-7" ></span>
                                                    </div>

                                                </div>
                                                <div class="tab-pane" id="tab2">

                                                    <input type="hidden" id="timecard-id" value="${timecardObj.id}"/>
                                                    <br>

                                                    <h3><strong>Step 2</strong> - Upload Image</h3>
                                                    <%--todo: create coding dropdown for each time element--%>
                                                    <div class="row">
                                                        <div action="/upload?id=${timecardObj.id}" class="dropzone dz-clickable"
                                                             id="ssdropzone">

                                                            <div class="dz-default dz-message">
                                                             <span>
                                                     <span class="text-center">
                                                         <span class="font-lg visible-xs-block visible-sm-block visible-lg-block">
                                                             <span class="font-lg"><i
                                                                     class="fa fa-caret-right text-danger">
                                                             </i> Drop files <span
                                                                     class="font-xs">to upload</span></span>
                                                         <span>&nbsp;&nbsp;<h4 class="display-inline"> (Or
                                                             Click)</h4></span></span></span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane" id="tab3">
                                                    <br>
                                                    <h3><strong>Step 3</strong> - Domain Setup</h3>
                                                    <div class="alert alert-info fade in">
                                                        <button class="close" data-dismiss="alert">
                                                            <i class="fa-fw fa fa-times-circle"></i>
                                                        </button>
                                                        <i class="fa-fw fa fa-info"></i>
                                                        <strong>Info!</strong> Please enter any notes associated with your submission.
                                                    </div>
                                                    <div class="form-group">
                                                        <label><strong>Notes: </strong></label>
                                                        <textarea class="form-control input-lg"
                                                               placeholder="Time Card Notes" name="etc"
                                                               id="inputNotes"></textarea>
                                                    </div>
                                                </div>
                                                <div class="tab-pane" id="tab4">
                                                    <br>
                                                    <h3><strong>Step 4</strong> - Save Form</h3>
                                                    <br>
                                                    <h1 class="text-center text-success" id="successSave"><strong>
                                                        <i class="fa fa-check fa-lg"></i> Complete</strong>
                                                    </h1>
                                                    <h1 style="color:red" class="text-center text-error" id="failedSave" color="red"><strong><i class="fa fa-meh-o"></i> Oops! Your Timecard didn't save!</strong></h1>
                                                    <br>
                                                    <div style="text-align: center">
                                                        <button id = "saveButton" type="button" class="btn btn-primary " style="float:left width:300px" onclick="saveTimecard()">Save Timecard</button>
                                                    </div>
                                                    <br>
                                                    <div style="text-align: center">
                                                        <button id="submitButton" type="button" class="btn btn-success " style="float:left width:300px" onclick="submitTimecard()">Submit Timecard</button>
                                                    </div>
                                                </div>


                                                <div class="form-actions">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <ul class="pager wizard no-margin no-steps-container">
                                                                <!--<li class="previous first disabled">
                                                                <a href="javascript:void(0);" class="btn btn-lg btn-default"> First </a>
                                                                </li>-->
                                                                <li class="previous disabled">
                                                                    <a href="javascript:void(0);"
                                                                       class="btn btn-lg btn-default"> Previous </a>
                                                                </li>
                                                                <!--<li class="next last">
                                                                <a href="javascript:void(0);" class="btn btn-lg btn-primary"> Last </a>
                                                                </li>-->
                                                                <li class="next">
                                                                    <a href="javascript:void(0);"
                                                                       class="btn btn-lg txt-color-darken"> Next </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                </div>



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
<script src="/static/js/plugin/dropzone/dropzone.min.js"></script>
<script src="/static/js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
<%--<script src="/static/js/plugin/dropzone/dropzone-amd-module.min.js"></script>--%>

<script type="text/javascript">
    $(document).ready(function () {

        buildStartPage();

        pageSetUp();

        viewMaster(true, 'TIMECARD ID', $('#timecard-id').val());

        Dropzone.autoDiscover = false;

        //Bootstrap Wizard Validations

        var $validator = $("#wizard-1").validate({

            rules: {
                email: {
                    required: true,
                    email: "Your email address must be in the format of name@domain.com"
                },
                fname: {
                    required: true
                },
                lname: {
                    required: true
                },
                country: {
                    required: true
                },
                city: {
                    required: true
                },
                postal: {
                    required: true,
                    minlength: 4
                },
                wphone: {
                    required: true,
                    minlength: 10
                },
                hphone: {
                    required: true,
                    minlength: 10
                }
            },

            messages: {
                fname: "Please specify your First name",
                lname: "Please specify your Last name",
                email: {
                    required: "We need your email address to contact you",
                    email: "Your email address must be in the format of name@domain.com"
                }
            },

            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
            },
            errorElement: 'span',
            errorClass: 'help-block',
            errorPlacement: function (error, element) {
                if (element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });

        $('#bootstrap-wizard-1').bootstrapWizard({
            'tabClass': 'form-wizard',
            'onNext': function (tab, navigation, index) {
                var $valid = $("#wizard-1").valid();
                if (!$valid) {
                    $validator.focusInvalid();
                    return false;
                } else {
                    $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).addClass(
                            'complete');
                    $('#bootstrap-wizard-1').find('.form-wizard').children('li').eq(index - 1).find('.step')
                            .html('<i class="fa fa-check"></i>');
                }
            }
        });

    })

</script>

</body>
</html>