<% /** Contributors:   Tony Morano  */%>

<%@include file="../includes/header.jsp" %>
<%@include file="../includes/navbar.jsp" %>
<%@include file="../includes/sidenav.jsp" %>
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
                            <div class="widget-body">
                                <div class="col-sm-12 col-md-12 col-lg-6">
                                    <!-- well -->
                                    <div class="well">
                                        <h3>Smart Notifications
                                            <small>with sound</small>
                                        </h3>
                                        <h5>Big box
                                            <small>(Static Example)</small>
                                        </h5>
                                        <p>
                                            Clutter free dynamic alert box, easy to configure and setup!
                                        </p>
                                        <p>
                                            <span class="label label-info"><i
                                                    class="fa fa-music"></i> Sound Enabled</span>
                                        </p>
                                        <div class="text-center">
                                            <img src="/static/img/demo/demo-smartbig-alert.png" alt="demo"
                                                 class="img-responsive">
                                        </div>
                                        <h5>Live Demo</h5>
                                        <p class="note">
                                            <span class="label bg-color-darken txt-color-white">INFO!</span> Messages
                                            are tabbale and does not overpopulate the user screen. Sounds can also be
                                            disabled if not needed
                                        </p>
                                        <ul class="demo-btns">
                                            <li>
                                                <a href="#" id="eg1" class="btn btn-primary"
                                                   data-vivaldi-spatnav-clickable="1"> <i class="fa fa-warning"></i>
                                                    Example 1 </a>
                                            </li>
                                            <li>
                                                <a href="#" id="eg2" class="btn btn-primary"
                                                   data-vivaldi-spatnav-clickable="1"> <i class="fa fa-bell"></i>
                                                    Example 2 </a>
                                            </li>
                                            <li>
                                                <a href="#" id="eg3" class="btn btn-primary"
                                                   data-vivaldi-spatnav-clickable="1"> <i class="fa fa-shield"></i>
                                                    Example 3 </a>
                                            </li>
                                            <li>
                                                <a href="#" id="eg4" class="btn btn-primary"
                                                   data-vivaldi-spatnav-clickable="1"> <i class="fa fa-check"></i>
                                                    Example 4 </a>
                                            </li>
                                        </ul>
                                        <h5>Small box alert</h5>
                                        <ul class="demo-btns">
                                            <li>
                                                <button type="button" id="eg5" class="btn btn-default"
                                                        data-vivaldi-spatnav-clickable="1">
                                                    With button
                                                </button>
                                            </li>
                                            <li>
                                                <button type="button" id="eg6" class="btn btn-default"
                                                        data-vivaldi-spatnav-clickable="1">
                                                    With Icon
                                                </button>
                                            </li>
                                        </ul>
                                        <p class="note">
                                            Easily customize the alerts to any colors of your choice, and add any icons
                                            from the theme library with animation!
                                        </p>
                                        <h5>
                                            <small>Extra Small Box</small>
                                        </h5>
                                        <ul class="demo-btns">
                                            <li>
                                                <button type="button" id="eg7" class="btn btn-default"
                                                        data-vivaldi-spatnav-clickable="1">
                                                    <i class="fa fa-thumbs-up"></i> Extra Small Alert
                                                </button>
                                            </li>
                                        </ul>
                                        <p class="note">
                                            Go even tinier with smaller attention messages!
                                        </p>
                                    </div>
                                    <!-- end well -->
                                    <!-- well -->
                                    <div class="well">
                                        <h3>Smart Alert
                                            <small>with sound</small>
                                        </h3>
                                        <h5 class="text-success">With Callback and Buttons
                                            <small>(Dynamic Example)</small>
                                        </h5>
                                        <ul class="demo-btns">
                                            <li>
                                                <a href="#" id="smart-mod-eg1" class="btn btn-success"
                                                   data-vivaldi-spatnav-clickable="1"> Callback ()</a>
                                            </li>
                                            <li>
                                                <a href="#" id="smart-mod-eg3" class="btn btn-success"
                                                   data-vivaldi-spatnav-clickable="1"> Many Buttons </a>
                                            </li>
                                        </ul>
                                        <h5 class="text-primary">With Input and Select</h5>
                                        <ul class="demo-btns">
                                            <li>
                                                <a href="#" id="smart-mod-eg2" class="btn btn-primary"
                                                   data-vivaldi-spatnav-clickable="1"> With Input </a>
                                            </li>
                                            <li>
                                                <a href="#" id="smart-mod-eg4" class="btn btn-primary"
                                                   data-vivaldi-spatnav-clickable="1"> With Select </a>
                                            </li>
                                        </ul>
                                        <h5>Log me in example</h5>
                                        <ul class="demo-btns">
                                            <li>
                                                <a href="#" id="smart-mod-eg5" class="btn btn-danger"
                                                   data-vivaldi-spatnav-clickable="1"> Login me in </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- end well -->
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
<script type="text/javascript">
    $(document).ready(function () {

        pageSetUp();

        /*
         * Smart Notifications
         */
        $('#eg1').click(function (e) {

            $.bigBox({
                title: "Big Information box",
                content: "This message will dissapear in 6 seconds!",
                color: "#C46A69",
                //timeout: 6000,
                icon: "fa fa-warning shake animated",
                number: "1",
                timeout: 6000
            });

            e.preventDefault();

        })

        $('#eg2').click(function (e) {

            $.bigBox({
                title: "Big Information box",
                content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                color: "#3276B1",
                //timeout: 8000,
                icon: "fa fa-bell swing animated",
                number: "2"
            });

            e.preventDefault();
        })

        $('#eg3').click(function (e) {

            $.bigBox({
                title: "Shield is up and running!",
                content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                color: "#C79121",
                //timeout: 8000,
                icon: "fa fa-shield fadeInLeft animated",
                number: "3"
            });

            e.preventDefault();

        })

        $('#eg4').click(function (e) {

            $.bigBox({
                title: "Success Message Example",
                content: "Lorem ipsum dolor sit amet, test consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                color: "#739E73",
                //timeout: 8000,
                icon: "fa fa-check",
                number: "4"
            }, function () {
                closedthis();
            });

            e.preventDefault();

        })


        $('#eg5').click(function () {

            $.smallBox({
                title: "Ding Dong!",
                content: "Someone's at the door...shall one get it sir? <p class='text-align-right'><a href='javascript:void(0);' class='btn btn-primary btn-sm'>Yes</a> <a href='javascript:void(0);' class='btn btn-danger btn-sm'>No</a></p>",
                color: "#296191",
                //timeout: 8000,
                icon: "fa fa-bell swing animated"
            });

        });


        $('#eg6').click(function () {

            $.smallBox({
                title: "Big Information box",
                content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                color: "#5384AF",
                //timeout: 8000,
                icon: "fa fa-bell"
            });

        })

        $('#eg7').click(function () {

            $.smallBox({
                title: "James Simmons liked your comment",
                content: "<i class='fa fa-clock-o'></i> <i>2 seconds ago...</i>",
                color: "#296191",
                iconSmall: "fa fa-thumbs-up bounce animated",
                timeout: 4000
            });

        })

        function closedthis() {
            $.smallBox({
                title: "Great! You just closed that last alert!",
                content: "This message will be gone in 5 seconds!",
                color: "#739E73",
                iconSmall: "fa fa-cloud",
                timeout: 5000
            });
        }

        /*
         * SmartAlerts
         */
        // With Callback
        $("#smart-mod-eg1").click(function (e) {
            $.SmartMessageBox({
                title: "Smart Alert!",
                content: "This is a confirmation box. Can be programmed for button callback",
                buttons: '[No][Yes]'
            }, function (ButtonPressed) {
                if (ButtonPressed === "Yes") {

                    $.smallBox({
                        title: "Callback function",
                        content: "<i class='fa fa-clock-o'></i> <i>You pressed Yes...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                }
                if (ButtonPressed === "No") {
                    $.smallBox({
                        title: "Callback function",
                        content: "<i class='fa fa-clock-o'></i> <i>You pressed No...</i>",
                        color: "#C46A69",
                        iconSmall: "fa fa-times fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                }

            });
            e.preventDefault();
        })
        // With Input
        $("#smart-mod-eg2").click(function (e) {

            $.SmartMessageBox({
                title: "Smart Alert: Input",
                content: "Please enter your user name",
                buttons: "[Accept]",
                input: "text",
                placeholder: "Enter your user name"
            }, function (ButtonPress, Value) {
                alert(ButtonPress + " " + Value);
            });

            e.preventDefault();
        })
        // With Buttons
        $("#smart-mod-eg3").click(function (e) {

            $.SmartMessageBox({
                title: "Smart Notification: Buttons",
                content: "Lots of buttons to go...",
                buttons: '[Need?][You][Do][Buttons][Many][How]'
            });

            e.preventDefault();
        })
        // With Select
        $("#smart-mod-eg4").click(function (e) {

            $.SmartMessageBox({
                title: "Smart Alert: Select",
                content: "You can even create a group of options.",
                buttons: "[Done]",
                input: "select",
                options: "[Costa Rica][United States][Autralia][Spain]"
            }, function (ButtonPress, Value) {
                alert(ButtonPress + " " + Value);
            });

            e.preventDefault();
        });

        // With Login
        $("#smart-mod-eg5").click(function (e) {

            $.SmartMessageBox({
                title: "Login form",
                content: "Please enter your user name",
                buttons: "[Cancel][Accept]",
                input: "text",
                placeholder: "Enter your user name"
            }, function (ButtonPress, Value) {
                if (ButtonPress == "Cancel") {
                    alert("Why did you cancel that? :(");
                    return 0;
                }

                Value1 = Value.toUpperCase();
                ValueOriginal = Value;
                $.SmartMessageBox({
                    title: "Hey! <strong>" + Value1 + ",</strong>",
                    content: "And now please provide your password:",
                    buttons: "[Login]",
                    input: "password",
                    placeholder: "Password"
                }, function (ButtonPress, Value) {
                    alert("Username: " + ValueOriginal + " and your password is: " + Value);
                });
            });

            e.preventDefault();
        });


    })
</script>
</body>
</html>