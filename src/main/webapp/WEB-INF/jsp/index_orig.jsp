<% /** Contributors:   Tony Morano  */%>

<%@include file="includes/header.jsp" %>
<%@include file="includes/navbar.jsp" %>
<%@include file="includes/sidenav.jsp" %>
<!-- MAIN PANEL -->
<div id="main" role="main">
    <%@include file="includes/ribbon.jsp" %>
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
                            <div class="widget-body">
                                <form id="wizard-1" novalidate="novalidate">
                                    <div id="bootstrap-wizard-1">
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-fw fa-lg fa-calendar"></i>
                                                                <strong>02/05/2017</strong>
                                                            </span>
                                                        <input type="number" min="0" max="24" step=".25"
                                                               class="form-control input-lg"
                                                               rel="tooltip" data-placement="top"
                                                               data-original-title="<h5>Sunday</h5>"
                                                               data-html="true" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-fw fa-lg fa-calendar"></i>
                                                                <strong>02/06/2017</strong>
                                                            </span>
                                                        <input type="number" min="0" max="24" step=".25"
                                                               class="form-control input-lg"
                                                               rel="tooltip" data-placement="top"
                                                               data-original-title="<h5>Monday</h5>"
                                                               data-html="true" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-fw fa-lg fa-calendar"></i>
                                                                <strong>02/07/2017</strong>
                                                            </span>
                                                        <input type="number" min="0" max="24" step=".25"
                                                               class="form-control input-lg"
                                                               rel="tooltip" data-placement="top"
                                                               data-original-title="<h5>Tuesday</h5>"
                                                               data-html="true" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-fw fa-lg fa-calendar"></i>
                                                                <strong>02/08/2017</strong>
                                                            </span>
                                                        <input type="number" min="0" max="24" step=".25"
                                                               class="form-control input-lg"
                                                               rel="tooltip" data-placement="top"
                                                               data-original-title="<h5>Wednesday</h5>"
                                                               data-html="true" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-fw fa-lg fa-calendar"></i>
                                                                <strong>02/09/2017</strong>
                                                            </span>
                                                        <input type="number" min="0" max="24" step=".25"
                                                               class="form-control input-lg"
                                                               rel="tooltip" data-placement="top"
                                                               data-original-title="<h5>Thursday</h5>"
                                                               data-html="true" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-fw fa-lg fa-calendar"></i>
                                                                <strong>02/10/2017</strong>
                                                            </span>
                                                        <input type="number" min="0" max="24" step=".25" id="tester"
                                                               class="form-control input-lg"
                                                               rel="tooltip" data-placement="top"
                                                               data-original-title="<h5>Friday</h5>"
                                                               data-html="true" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-fw fa-lg fa-calendar"></i>
                                                                <strong>02/11/2017</strong>
                                                            </span>
                                                        <input type="number" min="0" max="24" step=".25"
                                                               class="form-control input-lg"
                                                               rel="tooltip" data-placement="top"
                                                               data-original-title="<h5>Saturday</h5>"
                                                               data-html="true" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="fa fa-fw fa-lg fa-calendar"></i>
                                                                <strong>02/12/2017</strong>
                                                            </span>
                                                        <input type="number" min="0" max="24" step=".25"
                                                               class="form-control input-lg"
                                                               rel="tooltip" data-placement="top"
                                                               data-original-title="<h5>Sunday</h5>"
                                                               data-html="true" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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
<%@include file="includes/footer.jsp" %>
<%@include file="sub_includes/shortcut_icons.jsp" %>
<!--================================================== -->
<%@include file="sub_includes/commonScripts.jsp" %>
<script src="/static/js/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
<!-- PAGE RELATED PLUGIN(S)
<script src="..."></script>-->
<script type="text/javascript">
    $(document).ready(function () {

        pageSetUp();


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