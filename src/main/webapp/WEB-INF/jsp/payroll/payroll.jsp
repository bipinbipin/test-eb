<% /** Contributors:   Tony Morano  */%>
<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
<%@include file="../includes/sidenav.jsp" %>

<script src="/static/js/payroll.js"></script>

<style type="text/css">
    /** for all tables - could make dynamic **/
    th { font-size: 16px; }
</style>

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
            <!-- BEGIN FIRST WIDGET -->
            <div class="row">
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
                            <div class="widget-body">

                                <h1>PAYROLL ADMIN DASHBOARD</h1>

                                <div role="content">
                                    <!-- widget edit box -->
                                    <div class="jarviswidget-editbox">
                                        <!-- This area used as dropdown edit box -->

                                    </div>
                                    <!-- end widget edit box -->

                                    <!-- widget content -->
                                    <div class="widget-body no-padding">

                                        <!-- APPROVAL BUTTON -->
                                        <div class="row">
                                            <div class="col-md-5"></div>
                                            <div class="col-md-7">
                                                <a class="btn btn-primary" href="/approval">Approve Current Timecards</a>
                                            </div>
                                        </div>

                                        <!-- BEGIN FILTER BY WEEK/ENGINEER -->
                                        <form class="smart-form">
                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-md-12">
                                                        <label class="radio">
                                                            <input type="radio" name="filter-id" value="engineer">
                                                            <i></i>Engineer</label>
                                                        <label class="radio">
                                                            <input type="radio" value="week" name="filter-id" checked>
                                                            <i></i>Week</label>
                                                    </section>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group">

                                                        <div class="col-md-2">
                                                            <div class="icon-addon addon-md">
                                                                <%--<select id="SelectCriterion" class="form-control">--%>

                                                                <%--</select>--%>

                                                                <select id="engineer-select" class="form-control hidden">
                                                                    <c:forEach items="${engineers}" var="engineer" begin="0">
                                                                        <option value="${engineer.adpId}">${engineer.name}</option>
                                                                    </c:forEach>
                                                                </select>

                                                                <select id="week-select" class="form-control">
                                                                <c:forEach items="${weeks}" var="week" begin="0">
                                                                    <c:choose>
                                                                        <c:when test="${week.id == lastWeek.id}">
                                                                            <option value="${week.id}" selected>${week.beginDate} - ${week.endDate}</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option value="${week.id}">${week.beginDate} - ${week.endDate}</option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                                </select>
                                                                <label class="glyphicon glyphicon-search" rel="tooltip" title="" data-original-title="engineer"></label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </fieldset>
                                            <!-- END FILTER BY WEEK/ENGINEER -->

                                            <!-- BEGIN FILTER BY ISAPPROVED/ISONTIME -->
                                            <fieldset>
                                                <div class="row">
                                                    <section class="col col-5">
                                                        <label class="checkbox">
                                                            <input type="checkbox" class="radio" name="is-on-time" value="true">
                                                            <i></i>Is On Time</label>
                                                        <label class="checkbox">
                                                            <input type="checkbox" class="radio" name="is-on-time" value="false">
                                                            <i></i>Is Not On Time</label>
                                                        <label class="checkbox">
                                                            <input type="checkbox" class="radio" name="is-approved" value="true">
                                                            <i></i>Is Approved</label>
                                                        <label class="checkbox">
                                                            <input type="checkbox" class="radio" name="is-approved" value="false">
                                                            <i></i>Is Not Approved</label>
                                                    </section>
                                                </div>
                                            </fieldset>


                                            <button type="button" id="filter-timecards">Filter</button>
                                        </form>
                                        <!-- END FILTER BY ISAPPROVED/ISONTIME -->
                                    </div>
                                </div>
                                <!-- end widget content -->
                            </div>
                            <!-- end widget content -->
                        </div>
                        <!-- end widget div -->
                    </div>
                    <!-- end widget -->
                </article>
                <!-- WIDGET END -->
            </div>
            <!-- END FIRST WIDGET -->

            <!-- BEGIN SECOND WIDGET -->
            <div class="row">
                <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <!-- Widget ID (each widget will need unique ID)-->
                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-3" data-widget-editbutton="false">
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
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>Export to PDF / Excel</h2>
                        </header>
                        <!-- widget div-->
                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox">
                                <!-- This area used as dropdown edit box -->
                            </div>
                            <!-- end widget edit box -->
                            <!-- widget content -->
                            <div class="widget-body no-padding">
                                <!-- todo:  get this from the global handler -->
                                <input type="hidden" id="last-week" value="${lastWeek.id}" />

                                <!-- BEGIN TIMECARD TABLE -->
                                <div id="main-table" class="hidden">
                                <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">
                                    <thead>
                                        <tr>
                                            <th class="hidden">Timecard ID</th>
                                            <th class="hidden">Is On Time Value</th>
                                            <th class="hidden">Is Approved Value</th>
                                            <th class="hidden">Week ID</th>
                                            <th data-class="expand" class="engineer-name">Name</th>
                                            <th data-class="expand" class="ADPId">ADP ID</th>
                                            <th data-hide="phone,tablet" class="PTO">PTO</th>
                                            <th data-class="expand" id="pay-week" class="hidden">Pay Week</th>
                                            <th data-class="expand" style="width:125px;">Billable Time</th>
                                            <th data-class="expand" style="width:150px;">Billable OverTime</th>
                                            <th data-class="expand" style="width:75px;">On Time</th>
                                            <th data-class="expand">Denial Reason</th>
                                            <th style="width:175px;">Timecard Status&nbsp;&nbsp;&nbsp;&nbsp;
                                                <i class="fa fa-question-circle" rel="tooltip"
                                                    data-original-title="<div class='text-align-left'>
                                                                            <h4>Click to change:</h4>
                                                                            <table>
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class='black' style='padding-right:5px;'><i class='fa fa-square info'></i></td>
                                                                                        <td class='black'>Pending to Approved</td>
                                                                                        <td class='black' style='padding-left:5px;'><i class='fa fa-square success'></i></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td class='black'><i class='fa fa-square success'></i></td>
                                                                                        <td class='black'>Approved to Deny (Hold)</td>
                                                                                        <td class='black' style='padding-left:5px;'><i class='fa fa-square warning'></i></td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td class='black'><i class='fa fa-square warning'></i></td>
                                                                                        <td class='black'>Hold to Pending (for approval)</td>
                                                                                        <td class='black' style='padding-left:5px;'><i class='fa fa-square info'></i></td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                         </div>"
                                                    data-html="true"></i>
                                            </th>
                                            <th data-hide="phone,tablet">Workdays</th>
                                            <th data-hide="phone,tablet">Screen Shots</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <!-- sets the index for id use -->
                                        <c:set var="index" value="1"></c:set>

                                        <c:forEach items="${timecards}" var="timecard" begin="0">
                                            <tr id="timecard-${index}">
                                                <td class="hidden">${timecard.id}</td>
                                                <td class="hidden">${timecard.isOnTime}</td>
                                                <td class="hidden">${timecard.isApproved}</td>
                                                <td class="hidden">${timecard.week.id}</td>
                                                <td class="engineer-name">${timecard.engineer.name}</td>
                                                <td class="ADPId">${timecard.engineer.adpId}</td>
                                                <td class="PTO" id="pto-${index}">PTO HERE</td>
                                                <td class="pay-week-val hidden ">${timecard.week.beginDate} - ${timecard.week.endDate}</td>
                                                <td>${timecard.billableTime}</td>
                                                <td>${timecard.billableOverTime}</td>
                                                <td id="is-on-time-${index}" class="text-align-center">
                                                    <div id="is-on-time-change-${timecard.id}">
                                                        <!-- inputs icon based on week-id and onTime status -->
                                                        <c:choose>
                                                            <c:when test="${timecard.week.id == lastWeek.id + 1}">
                                                                <span class="glyphicon glyphicon-exclamation-sign this-week-icon"
                                                                      rel="tooltip"
                                                                      data-original-title="This week's timecard"></span>
                                                            </c:when>

                                                            <c:when test="${timecard.isOnTime}">
                                                                <span class="glyphicon glyphicon-ok-sign is-on-time-icon" onclick="changeOnTime(${timecard.id}, ${timecard.isOnTime})"></span>
                                                            </c:when>

                                                            <c:otherwise>
                                                                <span class="glyphicon glyphicon-remove-sign is-not-on-time-icon" onclick="changeOnTime(${timecard.id}, ${timecard.isOnTime})"></span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </td>

                                                <td>${timecard.denialReason}</td>

                                                <td id="status-${index}" class="text-align-center">
                                                    <!-- inputs button based of timecard boolean flags -->
                                                    <c:choose>
                                                        <c:when test="${timecard.isApproved}">
                                                            <button class="btn btn-success btn-payroll-status" onclick="changeApproval(${timecard.id}, ${timecard.isApproved})">Approved</button>
                                                        </c:when>

                                                        <c:when test="${!timecard.isSubmitted}">
                                                            <!-- sets color of Not Submitted based off current week id -->
                                                            <c:choose>
                                                                <c:when test="${timecard.week.id == lastWeek.id + 1}">
                                                                    <button class="btn btn-warning btn-payroll-status">Not Submitted</button>
                                                                </c:when>

                                                                <c:otherwise>
                                                                    <button class="btn btn-danger btn-payroll-status">Not Submitted</button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>

                                                        <c:when test="${timecard.isHeld}">
                                                            <button class="btn btn-warning btn-payroll-status" onclick="unlockTimecard(${timecard.id})">Held</button>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <button class="btn btn-info btn-payroll-status" onclick="changeApproval(${timecard.id}, ${timecard.isApproved})">Pending</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td id="workdays-${index}">
                                                    <a rel="tooltip"
                                                       data-original-title="
                                                            <table>
                                                                <tr>
                                                                    <th class='black' style='padding-right:5px;'>Sun</th>
                                                                    <th class='black' style='padding-right:5px;'>Mon</th>
                                                                    <th class='black' style='padding-right:5px;'>Tue</th>
                                                                    <th class='black' style='padding-right:5px;'>Wed</th>
                                                                    <th class='black' style='padding-right:5px;'>Thu</th>
                                                                    <th class='black' style='padding-right:5px;'>Fri</th>
                                                                    <th class='black' style='padding-right:5px;'>Sat</th>
                                                                </tr>

                                                                <tr>
                                                                    <td class='black'>${timecard.workDays[0].hours}</td>
                                                                    <td class='black'>${timecard.workDays[1].hours}</td>
                                                                    <td class='black'>${timecard.workDays[2].hours}</td>
                                                                    <td class='black'>${timecard.workDays[3].hours}</td>
                                                                    <td class='black'>${timecard.workDays[4].hours}</td>
                                                                    <td class='black'>${timecard.workDays[5].hours}</td>
                                                                    <td class='black'>${timecard.workDays[6].hours}</td>
                                                                </tr>
                                                            </table>"
                                                       data-html="true">
                                                        Workdays
                                                    </a>
                                                </td>
                                                <td id="screen-shots-${index}">Screen Shots</td>
                                            </tr>

                                            <c:set var="index" value="${index + 1}"></c:set>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                </div>
                                <!-- END TIMECARD TABLE -->

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
<script src="/static/js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="/static/js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="/static/js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="/static/js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="/static/js/plugin/datatables/fnFilterClear.js"></script>
<script src="/static/js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<script type="text/javascript">

    $(document).ready(function () {

        /**
         *  Anything using the variable datatable must remain in this file since it uses
         *  an external library (js libraries cannot be included in js files)
         */

        pageSetUp();

        var responsiveHelper_datatable_tabletools = undefined;

        var breakpointDefinition = {
            tablet : 1024,
            phone : 480
        };

        // http://legacy.datatables.net/usage/options#aoSearchCols - individual columns search

        /* TABLETOOLS */
        var datatable = $('#datatable_tabletools').dataTable({

            // Tabletools options:
            //   https://datatables.net/extensions/tabletools/button_options
            "order": [[7, 'desc'], [4, 'desc']],            //   order by pay week
            stateSave: true,
            "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-6 hidden-xs'T>r>" +
            "t" +
            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
            "oLanguage": {
                "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
            },
            "oTableTools": {
                "aButtons": [
                    {
                        "sExtends": "copy",
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    },
                    {
                        "sExtends": "csv",
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    },
                    {
                        "sExtends": "xls",
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    },
                    {
                        "sExtends": "pdf",
                        "sTitle": "SmartAdmin_PDF",
                        "sPdfMessage": "SmartAdmin PDF Export",
                        "sPdfSize": "letter"
                    },
                    {
                        "sExtends": "print",
                        "sMessage": "Generated by Aston <i>(press Esc to close)</i>"
                    }
                ],
                "sSwfPath": "/static/js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
            },
            "autoWidth": true,
            "preDrawCallback": function () {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_datatable_tabletools) {
                    responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper($('#datatable_tabletools'), breakpointDefinition);
                }
            },
            "rowCallback": function (nRow) {
                responsiveHelper_datatable_tabletools.createExpandIcon(nRow);
            },
            "drawCallback": function (oSettings) {
                responsiveHelper_datatable_tabletools.respond();
            }
        });
        /* END TABLETOOLS */



        //  BEGIN INITIALIZED CODE
        //  initial variabls
        var filterType = 'week';
        var isOnTime;
        var isApproved;
        var onTimeFlag;
        var approvedFlag;

//        datatable.fnSetFilteringDelay(550);

        //  generates the initial dropdown by week
        datatable.fnFilterClear();
        filterTableByCriteria(filterType);
        //  END INITIALIZED CODE



        //  BEGIN CHANGE FUNCTIONS
        //  on change for radio for week/engineer
        $('input[type=radio][name=filter-id]').on("change", function() {
            filterType = this.value;            //  gets this radio's value
            if(filterType == 'week') {
                $('#engineer-select').addClass('hidden');
                $('#week-select').removeClass('hidden');
            } else {
                $('#engineer-select').removeClass('hidden');
                $('#week-select').addClass('hidden');
            }

            datatable.fnFilterClear();
            filterTableByCriteria(filterType);
        });

        //  on dropdown change filter the table
        $('#week-select').on('change', function () {
            datatable.fnFilterClear();          //  clears the table filter
            filterTableByCriteria('week');  //  filters it by dropdown selection
        });

        $('#engineer-select').on('change', function () {
            datatable.fnFilterClear();          //  clears the table filter
            filterTableByCriteria('engineer');  //  filters it by dropdown selection
        });

        //  on change of onTime checkbox
        $('input[type=checkbox][name=is-on-time]').on("change", function() {
            onTimeFlag = false;
            isOnTime = false;
        });

        //  on change of approved checkbox
        $('input[type=checkbox][name=is-approved]').on("change", function() {
            approvedFlag = false;
            isApproved = false;
        });

        //  on click used to bind checkboxes to act like radio buttons
        $("input:checkbox").on('click', function() {
            // in the handler, 'this' refers to the box clicked on
            var $box = $(this);
            if ($box.is(":checked")) {
                // the name of the box is retrieved using the .attr() method
                // as it is assumed and expected to be immutable
                var group = "input:checkbox[name='" + $box.attr("name") + "']";
                // the checked state of the group/box on the other hand will change
                // and the current value is retrieved using .prop() method
                $(group).prop("checked", false);
                $box.prop("checked", true);
            } else {
                $box.prop("checked", false);
            }
        });

        //  on click filter timecards
        $('#filter-timecards').click(function() {
            filterTimecards();
        });
        //  END CHANGE FUNCTIONS



        //  BEGIN DATATABLE FUNCTIONS
        /**
         *  Shows columns based on WEEK/ENGINEER
         *
         *      Called By:  generateDropDown
         *
         * @param filterType    (string) week or engineer
         */
        function filterTableByCriteria(filterType) {

            if (filterType == 'week') {
                var criteria = $("#week-select option:selected").val();

                viewMaster(true, "CRITERIA", criteria);

                // filters appropriate row
                datatable.fnFilter(criteria, 3);

                //  hide/shows required data
                $('#pay-week').addClass('hidden');
                $('.pay-week-val').addClass('hidden');
                $('.engineer-name').show();
                $('.ADPId').show();
                $('.PTO').show();
                $('#main-table').removeClass('hidden');
            } else {
                var criteria = $("#engineer-select option:selected").val();
                // filters appropriate row
                datatable.fnFilter(criteria, 5);

                //  hide/shows required data
                $('#pay-week').removeClass('hidden');
                $('.pay-week-val').removeClass('hidden');
                $('.engineer-name').hide();
                $('.ADPId').hide();
                $('.PTO').hide();
                $('#main-table').removeClass('hidden');
            }
        }


        /**
         *  Filters timecards by isOnTime and isApproved
         */
        function filterTimecards() {
            //  clear the table filter
            datatable.fnFilterClear();

            //  get filter flags/values
            var filterIsOnTime = $('input[name="is-on-time"]:checked').val();
            var filterIsApproved = $('input[name="is-approved"]:checked').val();
            var onTimeFlag = false;
            var approvedFlag = false;

            //  display individual sets of information
            viewMaster(false, 'FILTER TYPE', filterType);
            viewMaster(false, 'FILTER IS ON TIME', filterIsOnTime);
            viewMaster(false, 'FILTER IS APPROVED', filterIsApproved);

            //  sets the flag as long as values aren't undefined
            if(filterIsOnTime != undefined) { onTimeFlag = true; }
            if(filterIsApproved != undefined) { approvedFlag = true; }

            //  filters it based off all the possible combinations of isOnTime and isApproved
            if(onTimeFlag && approvedFlag) {
                filterTableByCriteria(filterType);
                datatable.fnFilter(filterIsOnTime, 1);
                datatable.fnFilter(filterIsApproved, 2);
            } else if (onTimeFlag) {
                filterTableByCriteria(filterType);
                datatable.fnFilter(filterIsOnTime, 1);
            } else if (approvedFlag) {
                filterTableByCriteria(filterType);
                datatable.fnFilter(filterIsApproved, 2);
            } else {
                filterTableByCriteria(filterType);
            }

            //  view the flags
            viewMaster(false, "ON TIME FLAG", onTimeFlag);
            viewMaster(false, "APPROVED FLAG", approvedFlag);
        }
        //  END DATATABLE FUNCTIONS
    })
</script>
</body>
</html>